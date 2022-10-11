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

## Aula 2: mod01 - App Service

### App Service

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

### App Service

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
- fazendo agora o [Lab 01: Build a web application on Azure platform as a service offerings](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_01.html)

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

## Aula 4: lab02, mod03, lab03 - AppFunctions e Blob Storage

### AppFunctions

- [Lab 02: Implement task processing logic by using Azure Functions](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_02.html)

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

### Azure Blob Storage

- fazendo o Mod03
- fazendo o [Lab 03: Retrieve Azure Storage resources and metadata by using the Azure Storage SDK for .NET](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_03.html#instructions)

## Aula 5: mod04, lab04 e mod05 - CosmoDB e IasS

### CosmoDB

- Replicação Global
- níveis de consistência
- low latency
- elastic scale-out
- Vários tipos
    - SQL, mas bem limitado em relação a qlqr outra sql
    - MongoDB
    - table API (key-value)
    - Gremlin (graph)
    - Cassandra
- Tudo compatível com drivers e tools originais
- Resource hierarchy: Account > Database > Container (Collection/Graph/Table) > Item, Sproc, Trigger, user-defined function, Conflict
    - Account: A set of databases
    - Database: Logical container for containers that can (optionally) share throughput across the containers
    - Collection (container): A group of Items and programmatic resources usually related in some way
    - Document (item): An arbitrary unit of content. In many cases, this would be a JSON document
    - Stored procedure (sproc): Application logic written in JavaScript executed within the database engine as a transaction
    - Trigger: Application logic written in JavaScript executed before or after either an insert, replace, or delete operation
    - User-defined function: Application logic written in JavaScript to extend the SQL API query language
- Throughput
    - Request Units (RU's) 1KB=1RU, no mínimo 10 RU para cada 1GB
- Tip: qdo fazer Where, passar sempre a partitionKey para nao varrer tudo e asim nao gera alto custo
- Mod04

````shell
cd mod04-CosmosDB
dotnet new console
dotnet add package Microsoft.Azure.Cosmos
````

- [Lab 04: Construct a polyglot data solution](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_04.html)

### IasS VMs

- VM pricing models
    - Two primary costs for every VM:
        - Storage — The cost of storing data in every virtual hard disk. This cost is independent of whet er the VM is running
        - Compute — The usage-based price for compute capacity when the VM is currently allocated
    - There are two payment options for compute costs:
        - Pay as you go — Compute capacity is billed and paid as it is used without a long-term commitment
        - Reserved instances — Compute capacity can be pre-purchased at a reduced rate for anticipated usage

### IasS Deploy templates

## Aula 6: mod05 e lab05 - IasS

### IasS Docker

- provisionando na VM:
    - Instalar [Docker Desktop](https://www.docker.com/).
    - Instalar [WSL](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
    - Reiniciar VM e startar o Docker
    - `docker run hello-world`

- mod05-IasSDocker
    - Dockerfile simples
      ````shell
      cd mod05-IasSDocker
      dotnet new mvc --no-https
      dotnet publish -c release -o dist
      docker build . -t demoaspnet:1 -f Dockerfile.simple
      docker run --rm -d -p 8081:80 demoaspnet:1
      start http://localhost:8081/
      ````
    - Dockerfile com multi-stage building
      ````shell
      docker build . -t demoaspnet:1 -f Dockerfile.mult
      docker run --rm -d -p 8081:80 demoaspnet:1
      ````
    - Suba no docker hub e baixe-o
      ````shell
      docker pull fabianonalin/demoaspnet
      docker run --rm -d -p 8082:80 fabianonalin/demoaspnet
      start http://localhost:8082
      ````
- **ACR** - Azure Container Registry
    - Cria e da Push
      ````shell
      .\create-acr.ps1
      docker tag demoaspnet:2 rcsmod05demoacr.azurecr.io/demoaspnet:2
      az acr login -n rcsmod05demoacr
      docker push rcsmod05demoacr.azurecr.io/demoaspnet:2
      ````
    - Baixa e executa
      ````shell
      docker run --rm -d -p 8083:80 rcsmod05demoacr.azurecr.io/demoaspnet:2
      ````

- **ACI** - Azure Container Instance
    - para rodar container na cloud
      ````shell
      .\aci-create.ps1
      .\aci-enable.ps1
      ````

- [Lab 05: Deploy compute workloads by using images and containers](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_05.html)
    - fazer build da image na cloud
    - rodar a imagem de 3 jeitos
        - pelo az cli / cloud shell
        - vai até a version da imagem, clica no "..." e "Run Instance" (tem q estar ligadod o admin no ACR)
        - vai no ACI e cria uma nova instância, apontando o image source ao ACR e selecionar o Registry, image e version-tag

## Aula 7: mod06, lab06 e lab07 - AD e Security

### AD

- MSAL = MicroSoft Authentication Library
- [Lab 06: Authenticate by using OpenID Connect, MSAL, and .NET SDKs](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_06.html)

### Key Vault

- Azure Key Vault
  ````shell
  $rg="RG-Security"
  $loc="eastus"
  $vault="rcsmyvault$(Get-Random)"
  az group create -g $rg -l $loc
  az keyvault create -n $vault -g $rg -l $loc
  az keyvault secret set --vault-name $vault --name "DatabasePassword" --value "Passw.rd1234"
  az keyvault secret show --vault-name $vault -n "DatabasePassword"
  ````

### Az AD manager identity

- credenciais fora do codigo
- 2 tipo:
    - User-assinged: 1 user para varios recursos
    - System-assinged: 1 user para 1 recurso, e ao deletar recurso a indentidade deleta junto

### AZ App Configuration

- [Lab 07: Access resource secrets more securely across services](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_07.html)

## Aula 8: lab08 e lab09 - APIM, Event Grid e Event Hub

### APIM - API Management

- Segurança de API para acesso anonimo ou nao permitido
- Terminology
    - **Backend API**: A HTTP service that you implement with your business logic
    - **Frontend API**: A HTTP service façade hosted by API Management to obfuscate your back-end API
    - **Product**: One or more APIs in a package, can be open (free to use without any subscription) or protected (must be subscribed to before use)
    - **Operation**: A specific operation in the front-end API that correlates to a specific request/response from the backend API
        - Na operation vc pode adicionar inbound/outbound policy entre a Frontend e a Backend
- mod08
  ````powershell
  $rg = "RG-mod08APIM"
  $loc = "eastus"
  az group create -n $rg -l $loc
  
  $apim = "apim-$( Get-Random )"
  $email = "admin@contoso.com"
  $publisher = "Contoso"
  az apim create `
    -n $apim `
    --sku-name Consumption `
    -l $loc -g $rg `
    --publisher-email $email `
    --publisher-name $publisher
  ````

- [Lab 08: Create a multi-tier solution by using Azure services](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_08.html)

### Event Grid

- mod09
  ````shell
  let rNum=$RANDOM*$RANDOM
  myLocation=eastus
  myTopicName="az204-egtopic-${rNum}"
  mySiteName="az204-egsite-${rNum}"
  mySiteURL="https://${mySiteName}.azurewebsites.net"
  
  az group create --name az204-evgrid-rg --location $myLocation
  az provider register --namespace Microsoft.EventGrid
  az provider show -n Microsoft.EventGrid
  az provider show -n Microsoft.EventGrid --query "registrationState"
  az eventgrid topic create --name $myTopicName \ 
      --location $myLocation \
      --resource-group az204-evgrid-rg
  ````

### Event Hub

- mais usado para IoT e telemetria
- [Lab 09: Publish and subscribe to Event Grid events](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_09.html)

## Aula 9: mod10, lab10, mod11 e lab11 - Service Bus e App Insights

### Az Service Bus

- possibilita os apps de interagir entre si
- usa namespace para escopar as mensagens
- 2 mecanismos de comunicação: Queue e Topics

- Events vs Messagin services
    - Event Grid:
        - Propose: Reactive programming
        - Type: Big data pipeline
        - When to use: High-value enterprise messaging
    - Event Hub:
        - Propose: Event distribution (discrete)
        - Type: Event streaming (series)
        - When to use: Message
    - Service Bus:
        - Propose: React to status changes
        - Type: Telemetry and distributed data streaming
        - When to use: Order processing and financial transactions


- Queues
    - Messages are sent to and received from queues
    - Enables you to store messages until the receiving application is available to receive and process them
    - Supports a brokered messaging communication model
    - A general-purpose technology that can be used for a wide variety of scenarios

- Topics and subscriptions
    - Implements publish/subscribe (pub-sub) model
    - Receivers subscribe to a topic, and they can even filter down by interest
        - A sender publishes messages to the topic
        - Asynchronously, receivers get their own copy of the message
    - Subscriptions are independent, which allows for many independent "taps" into a message stream

- Primeiro cria o namespace e depois a entidade fila ou topico
    ````powershell
    $rg="ServiceBUSRG"
    $loc="eastus"
    az group create -n $rg -l $loc
    $svcbus="myservicebus$(Get-Random)"
    az servicebus namespace create -g $rg -l $loc -n $svcbus
    $queue="az204-queue"
    az servicebus queue create -g $rg --namespace-name $svcbus -n $queue
    dotnet new console -n Sender
    dotnet new console -n Receiver
    dotnet add package Azure.Messaging.ServiceBus
    ````

- [Lab 10: Asynchronously process messages by using Azure Service Bus Queues](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_10.html)

### Az Queue Storage

- lib cliente parecido com do blob
- diferenças:
    - Az Service Bus
        - é mais enterprise por ter tópicos e coisas avancadas
        - pode ser tópico ou fila
        - trabalha com outros protocolos
        - garante FIFO
    - Az Queue Storage
        - somente fila
        - so trabalho com HTTP
        - faz, mas nao garante FIFO

### App Insights

- [Lab 11: Monitor services that are deployed to Azure](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_11.html)

## Aula 10: mod12 e lab12 - Redis e CDN

### Azure Cache for Redis

- Redis
    - NoSQL de Key-value
    - Boas praticas: usar namespaces
    - mod12
      ````shell
      $rg="RedisDemoRG"
      $loc="eastus"
      az group create -n $rg -l $loc
      $redis="az204redis$(Get-Random)"
      az redis create -l $loc -g $rg -n $redis --sku Basic --vm-size c0
      dotnet new console -n RediscacheDemo
      dotnet add package StackExchange.Redis
      ````

### CDN

- Content Devivery NerWork
- Devivering public static resources, shared content
- Streaming video files
- IoT solutions, firmwares to update each device
- POP (point of Presence): apos a primeira request, armazena e distribui do cache para os demais requesters
- Dominos
- expiração de cache com regras
- [Lab 12: Enhance a web application by using the Azure Content Delivery Network](https://microsoftlearning.github.io/AZ-204-DevelopingSolutionsforMicrosoftAzure/Instructions/Labs/AZ-204_lab_12.html)
