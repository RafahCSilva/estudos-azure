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

## Aula 1: Intro e configurações do ambiente

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

## Aula 2: mod01 - Az App Service

- Azure App Service core concepts
- Creating an Azure App Service app
    - Basics
        - "App Service plan" é o que escala
        - dentro do "App Service plan" há various "Web app"
        - o Sku/Size escolhe os tiers (e tem um tier free de 60min/dia shared)
    - Deployment
    - Networking
    - Monitoring
        - Application Insights
    - Tags
    - Review + create
- Configuring and Monitoring App Service apps
    - no AppService, no menu Configuration
        - Application settings: ENV e Connections Strings
        - General settings: mudar stack
        - Default documents: root files como index.html
        - Handler mappings: volumes do docker
    - no menu Identity: connecta ao AD
    - no menu WebJobs: são processamento backgroud do app, como workers
- Scaling App Service apps
    - no menu App Service Plan:
        - no menu App: subir outras web apps, mas tem q estar na mesma regiao e mesmo OS
        - no menu Scale up / out: configurar escalamento vertical e horizontal
- Azure App Service staging environments
    - fazer swap de ambientes (ex hml com prod), bom para rollback de deploy
    - rotear trafego, blue/green (25% para feature e 75% para prod)
- Lab Configurando:
    ````shell
    mkdir htmlapp
    cd htmlapp/
    git clone https://github.com/Azure-Samples/html-docs-hello-world.git

    rg=DemoWebappRG
    loc=eastus
    az group create -g $rg -l $loc

    # up faz o provisionamento com values default
    az webapp up -g $rg --html --sku FREE
    # abrir no vscode web, editar algo
    code .
    # subir update
    az webapp up -g $rg --html --sku FREE
    # delete tudo
    az group delete -g $rg
    ````
- cria um novo App Service
- no menu Deployment Center, seleciona "source: local git" e save para ter um repo
    ````shell
    echo "<h1>Ola RCS</h1>" > index.html 
    git init
    git add .
    git commit -m "create app"
    git remote add azure1 https://rslab01demogit.scm.azurewebsites.net:443/rslab01demogit.git
    git remote -v
    gir push azure1 master
    # usar as credenciais em Deployment Center > Local Git/FTPS credentials
    # deverá deployar seu code no app
    # forcar index.html caso falhe o deploy
    az webapp config set --startup-file index.html -g RG-rslab01demogit -n rslab01demogit
    ````
    - [Microsoft Azure - WebApp - Deploy via Local GIT](https://youtu.be/h7Y07xaAR1o)
- Lab Slot:

## Aula 3: lab01 e mod02 - Azure Functions

### lab01

- fazendo um exemplo com dotnet com deploy em zip ou FTP
    - Cria um pj de dotnet
      ````shell
      # logar na ambiente-VM
      cd C:/www/mod01
      dotnet new mvc
      dotnet dev-certs https --trust
      # Build
      dotnet run
      dotnet publish -c release -o dist
      ````
    - criar script para create webapp
    - zipa o conteúdo de `/dist/`, cria script para Deploy do zip e run `.\create-webapp.ps1`
    - outro método, abre o FTP, faz upload do conteúdo de `/dist/` e run `.\deploy-webapp.ps1`
- fazendo agora o [Lab01](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_01.html)

### Azure Functions

- [Preparing for AZ-204 - Develop Azure compute solutions (1 of 5)](https://learn.microsoft.com/en-us/shows/exam-readiness-zone/preparing-for-az-204-develop-azure-compute-solutions-1-of-5)
- What can Azure Functions do?
    - Run code based on HTTP requests
    - Schedule code to run at predefined times
    - Process new and modified:
        - Azure Cosmos DB documents
        - Azure Storage blobs
        - Azure Queue storage messages
    - Respond to Azure Event Grid events by using subscriptions and filters
    - Respond to high volumes of Azure Event Hubs events
    - Respond to Azure Service Bus queue and topic messages

- definido pelo tempo de execução, 3 tipos de planos:
    - Consumption: max 5min
    - Premium: configurável o tempo máximo, acesso a rede, aceita containers
    - App Service plan
- O escalamento é controlado pela plataforma
- Bindings
    - Declarative way to connect to data from your code:
        - Connect to services without writing plumbing code
        - Service credentials are not stored code
        - Bindings are optional
    - Function can have multiple input and output bindings
    - Output bindings can send data to Azure services such as:
        - Storage
        - Azure Cosmos DB
        - Service Bus
- Best practices
    - Avoid long-running functions:
        - Functions that run for a long time can time out
    - Use queues for cross-function communication:
        - If you require direct communication, consider Durable Functions or Azure Logic Apps
    - Write stateless functions:
        - Functions should be stateless and idempotent
        - State data should be associated with your input and output payloads
    - Code defensively:
        - Assume that your function might need to continue from a previous fail point

- o "Function App" é uma container de "Functions" de uma mesma linguagem
- cada "Functions" pode ser Triggado ou ter bindings
- cada "Functions" pode ser deployado

## Aula 4

- [lab02](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_02.html)

````shell
func new --template "HTTP trigger" --name "Echo"
#    Use the up/down arrow keys to select a template:HTTP trigger
#    Function name: [HttpTrigger] Writing C:\www\lab02\Echo\index.js
#    Writing C:\www\lab02\Echo\function.json
#    The function "Echo" was created successfully from the "HTTP trigger" template.
npm i
func start --build
#    Azure Functions Core Tools
#    Core Tools Version:       4.0.4785 Commit hash: N/A  (64-bit)
#    Function Runtime Version: 4.10.4.19213
#    Functions:
#            Echo: [GET,POST] http://localhost:7071/api/Echo
#    [2022-09-29T22:58:47.278Z] Worker process started and initialized.
#    [2022-09-29T22:58:48.138Z] Executing 'Functions.Echo' (Reason='This function was programmatically called via the host APIs.', Id=0cffc78f-496b-40c1-8d84-b17a52b64013)
#    [2022-09-29T22:58:48.205Z] Received a request { query: { a: 's', q: '2' }, body: {} }
#    [2022-09-29T22:58:48.208Z] Executed 'Functions.Echo' (Succeeded, Id=0cffc78f-496b-40c1-8d84-b17a52b64013, Duration=70ms)
func new --template "Timer trigger" --name "Recurring"
#    Use the up/down arrow keys to select a template:Timer trigger
#    Function name: [TimerTrigger] Writing C:\www\lab02\Recurring\index.js
#    Writing C:\www\lab02\Recurring\readme.md
#    Writing C:\www\lab02\Recurring\function.json
#    The function "Recurring" was created successfully from the "Timer trigger" template.

func azure functionapp publish rcslab02funcstor2
#    Getting site publishing info...
#    Uploading package...
#    Uploading 172.41 MB [#############################################################################]
#    Upload completed successfully.
#    Deployment completed successfully.
#    Syncing triggers...
#    Functions in rcslab02funcstor2:
#        Echo - [httpTrigger]
#            Invoke url: https://rcslab02funcstor2.azurewebsites.net/api/echo
#    
#        GetSettingInfo - [httpTrigger]
#            Invoke url: https://rcslab02funcstor2.azurewebsites.net/api/getsettinginfo
#    
#        Recurring - [timerTrigger]
````

Azure Blob Storage

- fazendo o Mod03
- fazendo o [lab03](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_03.html#instructions)

## Aula 5

## Aula 6

## Aula 7

## Aula 8

## Aula 9

## Aula 10
