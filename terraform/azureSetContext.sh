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

echo "Cleaning Workspace"
rm -rfd $(find . -name \*.terraform -type d)
rm  $(find . -name provider.tf -type f)
echo "Done."

echo "Exporting Terraform Service Principal..."
export terraform_sp_pass=$(az keyvault secret show --vault-name alphasite-keyvault-dev --name alphasite-terraform-pass-dev --query value -otsv)
export terraform_sp_id=$(az ad sp list --display-name marcus-terraform-sp-bdm-dev --query [].appId -o tsv)
echo "Done."

echo "Setting Terraform SP ID and Pass in VarFile"
sed -i "s/%CLIENT_ID%/$terraform_sp_id/g" $VARFILE
sed -i "s/%CLIENT_SECRET%/$terraform_sp_pass/g" $VARFILE
echo "Done"


