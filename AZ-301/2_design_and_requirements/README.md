# Seção 2: Design and Requirements

## 4. Sobre o Exame AZ-301

- 40 a 60 questões
    - multiple choice
    - list
    - hot area
    - active screen
    - drag and drop
- 180 min
    - 150 min -> questions
    - 30 min -> instruções
- Case Studies
    - ponto de vista do cliente


## 5. Identificando os requerimentos

- Requeriments (o q vc tem q ser capaz para atender o cliente):
    - **Cases** => levantar os Cases do Cliente
        - Goals (metas)
        - Requirements Specific (o minimo q precisa para funcionar)
    - **Assumption** => o q o cliente acha q deve acontecer e ter quando migrar para a cloud
        - licensas, OS, Servers
    - **Success Factor** => o q é necessário para que a empresa do cliente seja de sucesso, quais tipos de aplicações, escalabilidade, qq os funcionários precisa saber para chegar ao sucesso, ou a melhoria buscada


## 6. SLA

- Siglas a decorar:
    - **SLAA** (Service-level Agreements) => contrato de quato em % o serviço vai estar disponivel
        - https://azure.microsoft.com/en-gb/support/legal/sla/
    - **MTTR** (Min time to recovery) => tempo até recuperar
    - **MTBF** (Min time between fails) => tempo entre falhas, algo recorrente
    - **RPO** (Recovery point objective) => intervalo de tempo q vc perdeu dados, gap entre o ultimo backup, ou seja data loss.
        - Se faz backup a cada 5min, entao pode perder no max 5min de dados
    - **RTO** (Recovery time objective) => qto tempo demora para colocar o ultimo backup no ar.

- se a azure tiver downtime, ela recompensa em creditos, na doc tem a tabela de cada 

- Composite SLA: em soluções compostas, apresente para o cliente a média dos SLAs, ex:
    - VM(99.99%) + SQL(99.95%) ~> 99.97% de SLA do todo
