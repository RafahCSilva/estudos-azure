az login

$rg = "RG-Blob"
$loc = "eastus"

az group create -n $rg -l $loc

$stor = "mystorage$( Get-Random )"
az storage account create -n $stor -g $rg --sku Standard_LRS -l $loc

$stor
