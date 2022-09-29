# logar
az login

# para checar todas as contas: az account list -o table
# para saber qual e a ativa no momento:  az account show
# para alterar: az account set -s <id>

$rg = "MyWebAppLinuxRG"
$loc = "eastus"
$webapp = "mywebapplinux-$( Get-Random )"
#criar resource group
az group create -n $rg -l $loc

#criar app service plan
az appservice plan create -g $rg -n $webapp --is-linux

#criar webapp
#  az webapp list-runtimes
az webapp create -g $rg -n $webapp -p $webapp --runtime "DOTNETCORE:6.0"

#apaga tudo
#az group delete --name $rg --no-wait --yes
