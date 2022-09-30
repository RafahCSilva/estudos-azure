## Conteúdo Programático

O curso Microsoft AZ-204 - Desenvolvimento no Azure é dividido em módulos, seguindo a sua agenda de encontros nas aulas ao vivo com os instrutores.

Como a dinâmica das aulas ao vivo engloba discussões, dúvidas e exercícios, é natural ter uma leve diferença entre o conteúdo programático planejado em cada módulo e o conteúdo ministrado. Fique tranquilo que o seu instrutor vai endereçar todos os temas do curso ao longo das aulas ao vivo.

### Conhecendo os Serviços de Aplicativo do Azure

- Explorar o Serviço de Aplicativo do Azure
    - Descrever os principais componentes e valores do Serviço de Aplicativo do Azure.
    - Explicar como o Serviço de Aplicativo do Azure gerencia a autenticação e a autorização.
    - Identificar métodos para controlar o tráfego de entrada e saída para seu aplicativo Web.
    - Implantar um aplicativo no Serviço de Aplicativo usando os comandos da CLI do Azure.
- Definir configurações do aplicativo Web
    - Crie configurações de aplicativo associadas aos slots de implantação.
    - Explique as opções de instalação de certificados SSL/TLS para seu aplicativo.
    - Habilite o log de diagnóstico para seu aplicativo para auxiliar no monitoramento e na depuração.
    - Crie um aplicativo virtual para mapeamentos de diretório.
- Escalar aplicativos no Serviço de Aplicativo do Azure
    - Identificar cenários em que o dimensionamento automático é uma solução adequada.
    - Criar regras de dimensionamento automático para um aplicativo Web.
    - Monitorar os efeitos do dimensionamento automático.
- Explorar os slots de implantação do Serviço de Aplicativo do Azure
    - Descrever os benefícios do uso de slots de implantação.
    - Entender como a troca de slots opera no Serviço de Aplicativo.
    - Executar trocas manuais e habilitar a troca automática.
    - Rotear o tráfego de forma manual e automática.

### Azure Functions

- Explorar o Azure Functions
    - Explicar as diferenças funcionais entre o Azure Functions, os Aplicativos Lógicos do Azure e o WebJobs
    - Descrever as opções do plano de hospedagem do Azure Functions
    - Descrever como o Azure Functions escala para atender às necessidades dos negócios
- Desenvolvimento do Azure Functions
    - Explicar os principais componentes de uma função e como eles são estruturados
    - Criar gatilhos e associações para controlar quando uma função é executada e para onde a saída é direcionada
    - Conectar uma função aos serviços no Azure
    - Criar uma função usando o Visual Studio Code e as Azure Functions Core Tools
- Implementar Durable Functions
    - Descrever os padrões de aplicativo normalmente usados em funções duráveis
    - Descrever os quatro tipos de função duráveis
    - Explicar a função dos hubs de tarefas em funções duráveis
    - Descrever o uso de orquestrações duráveis, temporizadores e eventos

### BLOBs no Azure

- Explorar o Armazenamento de Blobs do Azure
    - Identificar os diferentes tipos de contas de armazenamento e a hierarquia de recursos do Armazenamento de Blobs.
    - Explicar como os dados são armazenados e protegidos com segurança por meio de redundância.
    - Criar uma conta de armazenamento de blobs de blocos usando o Azure Cloud Shell.
- Gerenciar o ciclo de vida de armazenamento de BLOBs do Azure
    - Descreva como cada uma das camadas de acesso é otimizada.
    - Crie e implemente uma política de ciclo de vida.
    - Reidrate dados armazenados de blob em uma camada de arquivos.
- Trabalhar com o Armazenamento de Blobs do Azure
    - Desenvolver um aplicativo para criar e manipular dados usando a biblioteca de clientes do Armazenamento do
    - Azure para Armazenamento de Blobs.
    - Gerenciar propriedades e metadados de contêiner usando o .NET e o REST.

### Azure Cosmos DB

- Explorar o Azure Cosmos DB
    - Identificar os principais benefícios oferecidos pelo Azure Cosmos DB
    - Descrever os elementos em uma conta do Azure Cosmos DB e como eles são organizados
    - Explicar os diferentes níveis de consistência e escolher o correto para seu projeto
    - Explorar as APIs com suporte no Azure Cosmos DB e escolher a API apropriada para sua solução
    - Descrever como as unidades de solicitação afetam os custos
    - Criar recursos do Azure Cosmos DB usando o portal do Azure.
- Implementar o particionamento no Azure Cosmos DB
    - Descrever as diferenças entre partições lógicas e físicas
    - Escolher a chave de partição apropriada para sua solução
    - Crie uma chave de partição sintética
- Trabalhar com o Azure Cosmos DB
    - Identificar classes e métodos usados para criar recursos
    - Criar recursos usando o SDK do .NET v3 do Azure Cosmos DB
    - Escrever procedimentos armazenados, gatilhos e funções definidas pelo usuário usando JavaScript

### Gerenciando Recursos e Trabalhando com Containers

- Provisionar máquinas virtuais no Azure
    - Descreva as considerações de design para criar uma máquina virtual para dar suporte às suas necessidades de aplicativos.
    - Explique as diferentes opções de disponibilidade para VMs do Azure.
    - Descreva as opções de dimensionamento da VM.
    - Crie uma VM do Azure usando o CLI do Azure.
- Criar e implantar modelos do Azure Resource Manager
    - Descrever qual função do ARM tem no Azure e os benefícios de usar modelos do ARM.
    - Explicar o que acontece quando os modelos do ARM são implantados e como os estruturar para dar suporte à sua solução.
    - Criar um modelo com implantações de recursos condicionais.
    - Escolher o modo de implantação correto para sua solução.
    - Implementar um modelo do ARM usando o Visual Studio Code.
- Gerenciar imagens de contêiner no Registro de Contêiner do Azure
    - Explicar os recursos e os benefícios que o Registro de Contêiner do Azure oferece.
    - Descrever como usar as Tarefas do ACR para automatizar builds e implantações.
    - Explicar os elementos em um Dockerfile.
    - Criar e executar uma imagem no ACR usando a CLI do Azure.
- Executar imagens de contêiner em Instâncias de Contêiner do Azure
    - Descrever os benefícios da Instâncias de Contêiner do Azure e como os recursos são agrupados.
    - Implantar uma instância de contêiner no Azure usando a CLI do Azure.
    - Iniciar e interromper contêineres usando políticas.
    - Definir variáveis de ambiente em Instâncias de Contêiner do Azure.
    - Montar compartilhamentos de arquivos em suas instâncias de contêiner.

### Identidade e Autenticação

- Explorar a plataforma de identidade da Microsoft
    - Identificar os componentes da plataforma de identidade da Microsoft.
    - Descrever os três tipos de entidades de serviço e como elas se relacionam aos objetos de aplicativo.
    - Explicar como as permissões e o consentimento do usuário funcionam e como o acesso condicional afeta o aplicativo.
- Implementar a autenticação usando a Biblioteca de Autenticação da Microsoft
    - Explicar os benefícios de usar a Biblioteca de Autenticação da Microsoft e os cenários e tipos de aplicativos aos quais ela dá suporte.
    - Criar uma instância de aplicativos cliente públicos e confidenciais a partir do código.
    - Registrar um aplicativo com a plataforma de identidade da Microsoft.
    - Criar um aplicativo que recupere um token usando a biblioteca MSAL.NET.
- Implementar assinaturas de acesso compartilhado
    - Identifique os três tipos de assinaturas de acesso compartilhado.
    - Explique quando implementar assinaturas de acesso compartilhado.
    - Crie uma política de acesso armazenada.

### Microsoft Graph e Azure Key Vault

- Explorar o Microsoft Graph
    - Explique os benefícios do uso do Microsoft Graph.
    - Execute operações no Microsoft Graph usando REST e SDKs.
    - Aplique as melhores práticas para ajudar seus aplicativos a obter o máximo do Microsoft Graph.
- Implementar o Azure Key Vault
    - Descrever os benefícios de usar o Azure Key Vault
    - Explicar como autenticar-se no Azure Key Vault
    - Definir e recuperar um segredo do Azure Key Vault usando a CLI do Azure

### Gestão de Aplicativos e Identidades

- Implementar identidades gerenciadas
    - Explicar as diferenças entre os dois tipos de identidades gerenciadas
    - Descrever os fluxos de identidades gerenciadas atribuídas pelo usuário e pelo sistema
    - Configurar identidades gerenciadas
    - Adquirir tokens de acesso usando REST e código
- Implementar a Configuração de Aplicativos do Azure
    - Explicar os benefícios do uso da Configuração de Aplicativos do Azure
    - Descrever como a Configuração de Aplicativos do Azure armazena informações
    - Implementar o gerenciamento de recursos
    - Acessar com segurança suas informações de configuração de aplicativo
- Explorar Gerenciamento de API
    - Descrever os componentes (e suas funções) do serviço de Gerenciamento de API.
    - Explicar como os gateways de API podem ajudar a gerenciar chamadas para suas APIs.
    - Proteger o acesso a APIs usando assinaturas e certificados.
    - Criar uma API de back-end.

### Eventos do Azure

- Escolher uma Grade de Eventos do Azure
    - Descrever como a Grade de Eventos opera e como ela se conecta a serviços e manipuladores de eventos.
    - Explicar como a Grade de Eventos fornece eventos e como ele lida com erros.
    - Implementar autenticação e autorização.
    - Encaminhar eventos personalizados para o ponto de extremidade da Web usando CLI do Azure.
- Explorar Hubs de Eventos do Azure
    - Descrever os benefícios do uso de Hubs de Eventos e como ele captura dados de streaming.
    - Explicar como processar eventos.
    - Executar operações comuns com a biblioteca de clientes dos Hubs de Eventos.

### Desempenho dos Aplicativos

- Descubra as filas de mensagens do Azure
    - Escolher o mecanismo de fila adequado à sua solução.
    - Explicar como funcionam as entidades de mensagens que formam os principais recursos do Barramento de Serviço.
    - Enviar e receber mensagens de uma fila do Barramento de Serviço usando o .NET.
    - Identificar os principais componentes do Armazenamento de Filas do Azure.
    - Criar filas e gerenciar mensagens no Armazenamento de Filas do Azure usando o .NET.
- Monitorar o desempenho do aplicativo
    - Explica como o Azure Monitor funciona como o centro de monitoramento no Azure.
    - Descreva como o Application Insights funciona e como ele coleta eventos e métricas.
    - Instrumente um aplicativo para monitoramento, execute testes de disponibilidade e use o Mapa do Aplicativo para ajudá-lo a monitorar o desempenho e solucionar problemas

### Desenvolvimento para Redis e Armazenamento em CDNs

- Desenvolver para Cache do Azure para Redis
    - Explicar os principais cenários abrangidos pelo Cache do Azure para Redis e suas camadas de serviço.
    - Identificar os parâmetros de chave para criar uma instância do Cache do Azure para Redis e interagir com o cache.
    - Conectar um aplicativo para Cache do Azure para Redis usando o .NET Core.
- Desenvolver para armazenamento em CDNs
    - Explique como a Rede de Distribuição de Conteúdo do Azure funciona e como ela pode melhorar a experiência do usuário.
    - Controlar o comportamento do cache e limpar o conteúdo.
    - Execute ações na CDN do Azure usando a Biblioteca de CDN do Azure para .NET.
