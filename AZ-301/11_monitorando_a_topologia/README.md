# Seção 11: Monitorando a Topologia

## 82. Conceitos de Monitoramento

- Criar/instalar um serviço (VM, DB, VNet) é facil
- Mas é necessário monitorar a sua utilização, como a quantidade de uso de CPU, Memoria, IO de disco, trafego de network
- Toda essa informação é obtida pela ferramente da Azure chamada Monitoring
- Dentro da ferramente há 3 serviços:
    - **1º Monitor**: monitorar tudo em gráfico os usos
    - **2º Query e Logs**: armazena logs em storage, para fazer troubleshooting
    - **3º Alerts**: criar alertas para executar ações de acordo com o Monitoramento ou o Logging,


## 83. Monitoramento uma Virtual Machine

- Criar um RG
- Sobe um VM de Ubuntu do Tier Standard B1ms
- é possivel acessar o monitoring por 2 lugares:
    - entra na VM criado e nos grupo de submenu Monitoring
    - na Home, procurar pelo serviço Monitor
- Ao entrar no serviço Monitor, é possível acessar:
    - **Monitorar e Visualizar Métricas**: Métricas são valores numéricos disponíveis dos Recursos do Azure que ajudam você a entender a integridade, a operação e o desempenho dos sistemas.
    - **Consultar e Analisar Logs**: Logs são logs de atividade, logs de diagnóstico e telemetria de soluções de monitoramento; As consultas de análise ajudam com solução de problema e visualizações.
    - **Configurar Alerta e Ações**: Os alertas notificam você sobre condições críticas e potencialmente tomam medidas corretivas automatizadas baseadas em gatilhos de métricas ou logs.

- Monitor:
    - No formulario seleciona o Subscription, RG, Resource Type e seleciona o Recurso (VM, VNet, NIC, etc)
    - Ao selecionar a VM criada, agora selecione a Métrica (CPU ou Disk Read, ou Disk Write, etc) e a agregação (se será contagem, media, soma, max ou max). Assim plotará os dados no gráfico
        - pode add mais um tipo de Métrica no mesmo grafico
    - Pode add mais gráfico e tbm customizar sua exibição, como em barras, curva, pontos, e somente tabela
- Na VM > submenu Overview, já mostra graficos de monitoramente pre-configurados, como CPU media, Network total, Disk bytes, Disk Operation/sec
    - O botão de Pin deste gráfico pode ser fixado na sua Dashboard


## 84. Criando Alerta para uma Virtual Machine

- No menu Monitor, no servico Alerts
- Cria uma nova Regra de alerta, e terá q configurar: o recurso a ser monitorado, a condição e a ação
    - Selecione um Recurso...
    - Adiciona uma Condição (pagará por cada item, ex: $0,10):
        - A métrica a ser analisada => Percentage CPU
        - Threshold: Static (valores bruto) ou Dynamic => Static
        - Operator: maior, menor, igual, maior que... => >=
        - tipo de agregação: min, max, soma, contagem, media => max
        - o valor alvo => 90
        - granularidade da agregacao: pediror de quanto tempo => 5min
        - Frequencia q avaliará => a cada 1 mim
        - ==> verá a cada 1 minuto se o max da cpu for >= 90% dentro do último 5 min 
    - Cria ou seleciona um Grupo de Ação, para criar preenche:
        - nome do grupo de ação
        - shot name
        - subscription
        - RG
        - add ações:
            - Action name
            - Action Type
                - Automation Runbook (esse é aplicar ações automáticas como: Scale Up VM (ou Down), Restart VM, Stop VM, Remove VM)
                - Azure Function
                - Email Azure Resource Manger Role
                - Email/SMS/Push/Voice
                - ITSM
                - LogicApp
                - Secure Webhook
                - Webhook
    - Nome
    - Descrição
    - Severity: a severidade do alerta depois que os critérios especificados na regra de alerta são atendidos. A gravidade pode variar de 0 a 4.
        - Sev 0 = Critical
        - Sev 1 = Error
        - Sev 2 = Warning
        - Sev 3 = Informational
        - Sev 4 = Verbose
