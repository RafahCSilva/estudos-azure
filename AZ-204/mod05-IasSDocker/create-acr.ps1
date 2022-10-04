#az login

$rg = "RG-ACR"
$loc = "eastus"
$acr = "rcsmod05demoacr"

az group create -n $rg -l $loc
az acr create -g $rg -n $acr --sku Basic
