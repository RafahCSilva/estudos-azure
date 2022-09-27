# GREEN - curso Microsoft AZ-204 - Desenvolvimento no Azure

- LABs da MS [microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/)

Modules:

01. Create Azure App Service Web Apps
02. **Implement Azure Functions**
03. **Develop solutions that use blob storage**
04. **Develop solutions that use Cosmos DB storage**
05. Implement IaaS solutions
06. Implement user authentication and authorization
07. Implement secure cloud solutions
08. **Implement API Management**
09. Develop event-based solutions
10. **Develop message-based solutions**
11. Monitor and optimize Azure solutions
12. Integrate caching and content delivery within solutions

> A **presença** é preencher a **pesquisa diário** até meio-dia do dia seguinte;

## Aula 1 - Intro e configurações do ambiente

- introdução
- apresentação dos módulos
- contando o ambiente
- cadastro na Portal Azure
    - acessar o [portal.azure.com](https://portal.azure.com/), claim code em [www.microsoftazurepass.com](https://www.microsoftazurepass.com/)
- Criando VM-ambiente (East US, Win 11 Pro 21H2, x64, Standard D2s v3(2cpu8ram)) user = azureuser
    - Instale as dependências [AZ-204/lab](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/lab):
        - Chrome
        - git for windows
        - dotnet-6-sdk `dotnet --info`
        - azure cli [installation](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)
            - open powershell
            - `az login`
            - `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
            - `Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force`
            - `Connect-AzAccount`
        - VSCode e ext:
            - Azure Account
            - Azure Functions
            - Azure Resource Manager (ARM) Tools
            - Azure CLI Tools
            - C#
        - Azure Functions Core Tools [download](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local)
            - `func`
    - para Shutdown corretamente, vai no PortalAZ e clica em **STOP** para ficar status `Stopped (deallocated)`
- usaremos essa VM nos Lab ou usaremos o CloudShell
- Usando o CloudShell [](https://shell.azure.com)
    - em qlqr comando, usar o option `-o josnc` ou `table`, `yamlc` para formatar a output
    - listar regions `az account list-locations -o table`
    - Criar RG `az group create --location eastus --name "RG-Temp" -o yamlc`
    - List RG `az group list -o table`
    - Deletar RG `az group delete --name "RG-Temp" --no-wait -o yamlc -y`
- Usando o PowerShell
    - `Get-AzResourceGroup | Format-Table`
    - `New-AzResourceGroup -Name RG01 -Location eastus`
    - `Remove-AzResourceGroup -Name RG01 -AsJob -f`

## Aula 2

## Aula 3

## Aula 4

## Aula 5

## Aula 6

## Aula 7

## Aula 8

## Aula 9

## Aula 10
