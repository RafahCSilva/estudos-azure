# Seção 10: Serverless

## 92. O que é Serverless

- Sem servidor, sem ter acesso a ele, somente rodar logica.
- Servicos serveless do Azure:
    - Azure Functions -> C, JS, Java. So codar e ele executa
    - Logic Apps -> workflow (trigger) entre ferramentas (otimo para automação)
    - Events Grid -> eventos (otimo para logs)


## 93. Criando um Azure Function App

- No menu Function App, cria um app, e edita ele
- add uma Function
    - vc pode escolher como ela ira ser executada: via HTTP trigger (ex: get url/path), cron, queue storage trigger, blob storage trigger, cosmoDB trigger, IoT...
    - seleciona HTTP trigger
    - agora so codar a logica da função, que será executado por uma URL


## 94. Criando um Logic App

- Lab: numa Storage accout, no Blob stg, um container chamada "Pictures", toda vez q alguem fizer um upload será enviado um email.
- feito em duas parte:
    - Configura o trigger para um storage account verificar uma adicao no blob container indicado
    - Configura a acão de enviar um email via servidor do gmail

## 95. Criando um Event Grid Viewer

- Vai no menu Event Grid Topic, cria um topico
    - Edite ele e crie um Event Subscription (de onde será coletado)
        - EndPoint Detail é a url do Event Viewer (um template da MS https://docs.microsoft.com/en-gb/samples/azure-samples/azure-event-grid-viewer/azure-event-grid-viewer/)
- https://docs.microsoft.com/en-us/azure/event-grid/overview

## 96. Removendo o Resource Group
