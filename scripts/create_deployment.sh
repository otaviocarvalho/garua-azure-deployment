#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# -e: immediately exit if any command has a non-zero exit status
# -o: prevents errors in a pipeline from being masked
# IFS new value is less likely to cause confusing bugs when looping arrays or arguments (e.g. $@)

usage() { echo "Usage: $0 -i <subscriptionId> -g <resourceGroupName> -n <deploymentName> -f <deploymentFile> -l <location>" 1>&2; exit 1; }

declare subscriptionId=""
declare resourceGroupName=""
declare deploymentName=""
declare deploymentFile=""
declare locationName=""

# Initialize parameters specified from command line
while getopts ":i:g:n:f:l:" arg; do
	case "${arg}" in
		i)
			subscriptionId=${OPTARG}
			;;
		g)
			resourceGroupName=${OPTARG}
			;;
		n)
			deploymentName=${OPTARG}
			;;
		f)
			deploymentFile=${OPTARG}
            ;;
        l)
			locationName=${OPTARG}

		esac
done
shift $((OPTIND-1))

#Prompt for parameters is some required parameters are missing
if [[ -z "$subscriptionId" ]]; then
	echo "Subscription Id:"
	read subscriptionId
	[[ "${subscriptionId:?}" ]]
fi

if [[ -z "$resourceGroupName" ]]; then
	echo "ResourceGroupName:"
	read resourceGroupName
	[[ "${resourceGroupName:?}" ]]
fi

if [[ -z "$deploymentName" ]]; then
	echo "DeploymentName:"
	read deploymentName
fi

if [[ -z "$deploymentFile" ]]; then
	echo "DeploymentFile:"
	read deploymentFile
fi

if [[ -z "$locationName" ]]; then
	echo "LocationName:"
	read locationName
fi


#templateFile Path - template file to be used
#templateFilePath="template.json"
templateFilePath=$deploymentFile

if [ ! -f "$templateFilePath" ]; then
	echo "$templateFilePath not found"
	exit 1
fi

#parameter file path
#parametersFilePath="parameters.json"

#if [ ! -f "$parametersFilePath" ]; then
	#echo "$parametersFilePath not found"
	#exit 1
#fi

if [ -z "$subscriptionId" ] || [ -z "$resourceGroupName" ] || [ -z "$deploymentName" ]; then
	echo "Either one of subscriptionId, resourceGroupName, deploymentName is empty"
	usage
fi

##login to azure using your credentials
#az account show 1> /dev/null

#if [ $? != 0 ];
#then
	#az login
#fi

##set the default subscription id
#az account set --subscription $subscriptionId

#set +e

# Check for existing Resource Group
# az account list-locations
# az group show -n $resourceGroupName 1> /dev/null

echo "Creating resource group and vnet default with name" $resourceGroupName
set -e
(
    set -x
    az group create -n $resourceGroupName --location $locationName 1> /dev/null
    az network vnet create --name default --resource-group $resourceGroupName --subnet-name default
)

#Start deployment
echo "Starting deployment..."
(
	set -x
	az group deployment create --name $deploymentName --resource-group $resourceGroupName --template-file $templateFilePath --no-wait
    az group deployment wait --name $deploymentName --resource-group $resourceGroupName --updated --timeout 7200
)

if [ $?  == 0 ];
 then
	echo "Template has been successfully deployed"
fi
