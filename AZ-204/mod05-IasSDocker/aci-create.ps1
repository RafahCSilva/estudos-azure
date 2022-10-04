#az login

$rg = "RG-ACR"
$loc = "eastus"
$acr = "rcsmod05demoacr"

$aci = "rcsmod05-meu-aci"
$image = "rcsmod05demoacr.azurecr.io/demoaspnet:2"
$acrpass = "Tmf3dcvrpaNnhRTYyNd8TSv2mRgjq9+d"

az container create `
    -g $rg -n $aci `
    --image $image `
    --cpu 2 `
    --memory 4 `
    --registry-username $acr `
    --registry-password $acrpass `
    --dns-name-label $aci `
    --ports 80

start rcsmod05-meu-aci.eastus.azurecontainer.io
