# Seção 9: Apps

## 87. Introdução a Azure Apps

- Serviço da MS para q vc suba seu web site, sempre precisar configurar todo o: RB, VNet, Dominio, VM, DataBase, LoadBalancer, multi AvailableZone ...
- Assim vc so se preocupa com o codigo do site, e nao da infra, basta setar o nivel de prerformaces q vc quer
    - WebApps -> website
    - Mobile Apps -> BackEnd
    - Logic Apps -> Automation
    - Api Apps


## 88. Criando um WebApp na Plataforma

- no menu App Services, cria um webapp
    - seleciona se será publicado via CODE ou via DOCKER CONTAINER
    - se Code, selecionar ql o RunTime Stack: PHP, Java, ASP, Node, Python...
    - Ql o OS: Win ou Linux
    - e o App Service Plano: ql o poder de processamento (as opcoes de tier)


## 89. Realizando o Download e Instalacao do Microsoft Visual Studio Code

- Um plugin do VSCode: Azure App Service
- loga com o Azure, lista os AppServices disponíveis, pode acessar o Cosmos DB, e editar os arquivos, fazendo upload automatico ao salvar


## 90. Conceitos de Slots

Slot é um ambiente paralelo para que vc possa criar ambiente de HML, dev, test.
E no final oder fazer o SWAP de DEV com PROD, levando a atualização para Prod e o q tava em Prod para o DEV, para rollback 
criar outros sistema em paralelo, separando em PROD e de TEST
https://docs.microsoft.com/pt-br/azure/app-service/deploy-staging-slots


## 91. Testando o Swap de Slots

- No submenu Deployment Slots
- Ao criar um Slot, vc indica de ql outro slot vc quer clonar
- Ago fazer Swap, basta indicar os 2 slots para tal
