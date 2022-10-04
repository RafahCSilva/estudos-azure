#az login

$rg = "RG-ACR"
$loc = "eastus"
$acr = "rcsmod05demoacr"

# ativar no ACR para utiliza-lo localmente, tipo login do docker hub
az acr login -n $acr

# ativa "Admin user" neste acr
az acr update -n $acr --admin-enabled
