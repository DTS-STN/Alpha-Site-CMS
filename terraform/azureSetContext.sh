#!/bin/bash

VARFILE=$1

echo "Loading in variables from varfile"
echo $VARFILE
export TG_VAR_FILE=$VARFILE
export subscription_id=$(cat $VARFILE | jq -r .subscription_id)
export depot_resource_group_name=$(cat $VARFILE | jq -r .depot_resource_group_name)
export location=$(cat $VARFILE | jq -r .location)
export storage_account_name=$(cat $VARFILE | jq -r .storage_account_name)
export application_name=$(cat $VARFILE | jq -r .application_name)

echo "Setting account"
az account set --subscription $subscription_id
echo "Done."

echo "Downloading varfile from azure storage account.."
az storage blob download --account-name $storage_account_name --container-name $application_name --file $TG_VAR_FILE -n variables.json
echo "Done."


