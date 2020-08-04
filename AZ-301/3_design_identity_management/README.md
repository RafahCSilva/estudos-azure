# Seção 3: Design Identity Management

Repetido totalmente do AZ-300 - Seção 7: Gerenciamento e Segurança


## 7. Sua conta na Azure

https://azure.microsoft.com/en-gb/free/


## 8. Entendendo o Conceito de Active Directory para Cloud

- Cadastro de Usuário centralizado
- Grupos de Usuários
- Permissionamento no file server

- servicos de AD no Azure
    - AAD = Azure AD
        - cloud
        - Office 365
        - Sync do AD cloud com o AD local
    - ADDS = AD Domain Services
        - Kerberos e LDAP
        - Windows
    - AADDS= Azure ADDS
        - administrado pelo propria Microsoft, tem q abrir ticket para eles fazerem o vc necessitar
        - $$$ mias caro


## 9. Quando custa utilizar o Azure AD

https://azure.microsoft.com/en-us/pricing/details/active-directory/


## 10. Hands On - Criando um novo Azure AD Tenant

- O AD agrupa por cima as Subscritions
- Criar um tenent cria um novo modo de login


## 11. Hands On - Criando Grupos e Usuários no Azure AD

- Criar um novo Grupo:
    - Group Type: security (users monitorados, quais perm), Office365 (security somado ao poder usar o Office365)
- Criar usuário
    - um por um
    - ou em lote via CSV ou Invites
    - Um CRUD de usuario, podendo resetar senta e etcs


## 12. Hands On - Habilitando MFA na sua Conta da Azure

- Na listagem de usuarios, há o link para o Multi-Factor Authentication
- listas os users e se ele esta habilitado
- podendo editar para ativar
    - ou forcar q use sempre


## 13. Hands On - Habilitando o Azure AD Self Service Password

- possibilitar q o usuario consiga recuperar 
- recurso desabilitado por default, logo tem ser habilitado pelo admin
    - somente em Pacote PREMIUN P2
- na habilitação: None, selected (para grupos selecionados) ou all


## 14. Entendendo sobre o Azure AD Connect

- Sincroniza o AD local com da Azure
- Edição de Usuário sincronizada
- Usuário troca de senhas sincronizada
- Prevent acidental delete: se deletar local, nao deleta da nuvem e vice-versa, tem q deletar nos dois lugares
- Suporta AD federarion server (aqueles MFA custom, como cartao de acesso)
- AzureAD Connect Health: monitorar o AD
- https://docs.microsoft.com/en-us/azure/active-directory/hybrid/tutorial-password-hash-sync
    - https://docs.microsoft.com/pt-br/azure/active-directory/hybrid/tutorial-password-hash-sync


## 15. Hands On - Criando o cenário para o Azure AD Connect

- Instala o Windows Server 2019


## 16. Hands On - Instalando e Configurando o Active Directory no Windows 2019

- Instala o AD Server na VM


## 17. Hands On - Configurando o Azure AD Connect

- dentro da VM, acessa o azure, vai no AAD
- no submenu Azure AD Connect, baixa o client e instala
- no cliente, configure como precisa,
    - para conectar no ADD, tem q logar com um user q tenha role "Global Administrator" (add tal role a algum user)
    - para conectar ao AD local, entre com as credenciais do admin do AD local
    - por fim inicie a Sync, e instalará e será configurado o servico de sync do AD


## 18. Hands On - Testando a Syncronizacao do AD Connect

- cria um user de cada lado, espera o tempo e depois verifica se ambos os users constam dos dois lados
- demora um pequeno tempo até a sync acontecer


## 19. Hands On - Monitorado com o Azure AD Connect Health

- Instalado dentro do AD local, e envia relatorios para o Azure, monitorando se há problemas
- no mesmo submenu do Azure AD Connect, há o topico do "HEALTH AND ANALYTICS"
    - te da 3 opcoes de download, Download and install Azure AD Connect Health Agents to get health and usage information of your on premise services.
        - Download Azure AD Connect Health Agent for AD FS (com federation)
        - Download Azure AD Connect (configures Azure AD Connect Health agent for sync) (Health e sync)
        - Download Azure AD Connect Health Agent for AD DS (para o Domain Service) (usou essa opcao)
    - instala e configura para o servico ser instalado
        - qdo soliciatar login, use as credenciais do user q tem Global Administrator


## 20. Conceitos de PIM

- PIM = Privileged Identity Management do Azure AD
    - um serviço que permite gerenciar, controlar e monitorar o acesso a importantes recursos (incluindo Azure, AAD, Office365 etc) em sua organização
    - mostra um relatorio do q o usuario pode acessar e poder gerencia-lo
- User do AD acessar o Azure ou outras SAAS
    - com acesso ao subscription
    - global admin
- Licensa P2
- Permitir ou Bloquear q user acesse Recursos ou AD
    - por dendo ser por horas
- Visualizar como log o q o user fez em todo o Azure
- Setup alerts
- Workflow para o user requerir ao admin para aprovar algum recurso

- Roles q se pode criar:
    - Directory Roles:
        - AD Roles
    - Resource Roles:
        - RBAC
        - Roles (regras de tipos de recurso q ele pode usar)
        - Subscriptions (quanto ele pode gastar)
        
- https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure
- https://docs.microsoft.com/pt-br/azure/active-directory/privileged-identity-management/pim-configure
    - O que ela faz? O PIM fornece ativação de função baseada em tempo e aprovação para atenuar os riscos de permissões de acesso excessivas, desnecessárias ou que foram indevidamente utilizadas em recursos importantes.
    - Estes são alguns dos principais recursos do Privileged Identity Management:
        - Fornecer acesso privilegiado **just-in-time** ao Azure AD e aos recursos do Azure
        - Atribua acesso com **limite de tempo** aos recursos usando as datas de início e término
        - Exigir **aprovação** para ativar funções com privilégios
        - Impor **autenticação multifator** para ativar qualquer função
        - Usar **justificativa** para entender por que os usuários ativam
        - Obter **notificações** quando as funções privilegiadas forem ativadas
        - Realizar **revisões de acesso** para garantir que os usuários ainda precisem de funções
        - Baixar o **histórico de auditoria** para auditoria interna ou externa
    - **Terminologia**:
        - **Termo ou conceito**	(_Categoria de atribuição de função_): Descrição
        - *eligible* qualificado (Type): precisa executar 1ou+ ações para ativa-la, pois ele nao precisa te-la ativado o tempo todo
        - *active* ativo (Type): role atribuida
        - *activate* ativar: precisa de 1ou+ ações para ativar nele, ou solicitacao de aprovacao
        - *assigned* atribuída (Estado): role atribuida
        - *activated* ativada (Estado): user fez as acoes para ativa-lo por um tempo
        - *permanent eligible* qualificada permanentemente (Duration): sempre qualificado para ativar novamente
        - *permanent active* permanentemente ativa (Duration): sempre  ativo
        - *expire eligible* qualificado com expiração (Duration): 
        - *expire active* ativo com expiração (Duration): ativo dentro de uma datetime-box
        - *just-in-time (JIT) access*: somente no momento especifico q precisae
        - *principle of least privilege access* princípio de acesso de privilégios mínimos: todos com role o minimo


## 21. Hands On - Configurando PIM para AD Roles

- para SOMENTE ROLES do AD
- vai em um user do AD, add ele a role Global Admin
- em Licenses, add a licensa "AAD Premiun P2"
- no Menu vai em PIM (tem q habilitar no MFA para poder editar o PIM)
- no submenu Consent to PIM, basta consentir e aguardar processar
- no submenu AAD Roles (tem q se associar e consentir tbm)
    - no Overview visualiza stats de qtdd de user em cada roles
    - Verificar Roles
    - Aprovar Requestes
    - Revisar acessos (listar user com suas roles)
    - Wizard: gerenciar com next-next-finish 
        - modo rapido de visualizar stats de roles e seus users
        - selecionar os user para revisar
        - selecionar o q ele se tornara
    - My audit history: log do q vc fez


## 22. Hands On - Habilitando PIM RBAC

- para SOMENTE ROLES do Azure Resource
- No menu PIM, no submenu Azure Resource
    - Precisa ter uma subscription ativa (cadastrar Cartao de Credito)
- nos submenus podera:
    - Visualizará todos os recursos
    - Request pendentes
    - Request aprovado
    - revisar acessos
    - gerenciar seus requests de acessos
    - audit: log
- no sub menu Role,s poderá gerenciar os users dentro de cada role
    - ao associar user numa role, aqui indicara se ele será:
        - Eligiable: ele terá acesso dentro de um datetime-box (no max 3 meses)
        - Active: ele terá acesso dentro de um datetime-box (no max 1 meses)
- no submenu Setting, é possivel editar as regras do associado de role-user
    - se permite permanent eligible
    - tempo maximo do datetime-box
    - requerir MFA
    - requerir textarea de justificativa
    - duracao que ficara ativo qdo o eligible fazer as acoes para ativar
