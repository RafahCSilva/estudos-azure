# Seção 4: Database

## 23. Conceitos de Data Services

- tipos de dados:
    - Structured data
        - database (sql), rows/columns, excel
    - Semi-Structured data
        - dados esparsos, mas identificados por Keys ou Tags (noSQL)
    - Unstructured data
        - Blob (pdf, jpeg, txt, doc)


## 24. Conceitos do Azure SQL

- Azure SQL:
    - SQL server as a service
    - gerenciado pela MS
    - Ultima versão do SQL Server
    - Migration database local para cloud (ferramente: MS data migration assistance)
- Maiores caracteristicas:
    - 1º Performance:
        - DTU (Database Transaction Unit): quantidade de dados q consegue trafegar
    - 2º Compatibility: migrar pela tool de migration
    - 3º Simplified Management
- Tiers (planos) https://docs.microsoft.com/pt-br/azure/azure-sql/database/service-tiers-dtu :
    - Basic: desenvolvimento e bem fraca
    - Standard: media, grande performace
    - Premium: porformace estrema, baixíssima latencia


## 25. Valores do Azure SQL

- 2 modos de cobranças:
    - `vCore` => escolhe por tier com cores (=hyperthread) e memory
        - Server Tier:
            - `Generar porpose` => gerais
            - `Business critical` => alto desempenho, alto I/O de dados, replicas isoladas
            - `hyperscale` => alta escalabilidade
        - Compute Tier:
            - serverless (sem VM) (so escolhe qtos core+memory quer)
            - provisioned compute (VM) (escolhe o tier da VM)
    - `DTU` => escolhe por DTU 
- Backup storage (pago por GB ao mes)
    - Point-in-time restore: 
        - default de 7 dias armazenados em RA-GRS blob storage
        - pode aumentar até 35 dias de retencaao
        - qlqr corrupcao ou deletaçãi, pode estaura qlqr ponto q estar armazenado
    - Long-term retention
        - para busyness q necessitar auditorias e etc, podendo guarda até por 10 anos


## 26. Hands On - Criando um Database Azure SQL

- Na home, procura por SQL Databases, e cria uma:
    - Basic
        - seleciona o Subscription e ResourceGroup
        - Dataabase details
            - nome do database
            - o servidor
                - criar um novo: nome do servidor, server admin login, password, location
            - se deseja usar o SQL elastic pool? Y/N
            - Compute + storage:
                - aqui seleciona os tiers da VM (os estudados na seção anterior)
    - Networking
        - metodo de acesso: no access; public; private
        - firewall
    - Additional settings
        - data source: vazia; a partir de um backup; sample
        - database collation (nao pode mudar depois de criado)
        - Advanced data security (pacote q add featues de seguranca ao database, como? descobrir e classificar dados sensiveis, mitigar vulnerabilidades, detectar atividades anomalias)
- apos criado, entrea nela, e cada menu


## 27. Hands On - Adicionando Long Term Retention ao SQL

- dentro de um database criado, no submenu overview, clica no server name
    - no submenu Manage Backups
    - lista os backups realizado
    - seleciona o backup, clica no botão Configure Retention
    - no form pode configurar o tempo de retenção, LTR e LRT de anos
