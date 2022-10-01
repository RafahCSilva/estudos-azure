# az login

$rg = "CosmosDBRG"
$loc = "eastus"

az group create -n $rg -l $loc

$cosmosdb = "mycosmos$( Get-Random )"
az cosmosdb create -n $cosmosdb -g $rg

$connstring = az cosmosdb keys list -n $cosmosdb -g $rg
$connstring
