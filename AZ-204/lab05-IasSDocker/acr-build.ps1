$rg = "RG-ACR"
$registryName = "rcslab05acr"
az acr check-name --name $registryName
az acr create --resource-group $rg --name $registryName --sku Basic

# Fazendo BUILD na cloud
az acr build --registry $registryName --image ipcheck:latest .
