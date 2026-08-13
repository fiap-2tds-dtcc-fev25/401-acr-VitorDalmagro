RG_NAME=rg-rm566052-acr
LOCATION=mexicocentral

az group create --name $RG_NAME --location $LOCATION

# az provider register --namespace Microsoft.ContainerRegistry

az acr create \
    --resource-group $RG_NAME \
    --name 2tdsarm566052 \
    --sku Basic \
    --location $LOCATION \
    --public-network-enabled true \
    --admin-enabled true
