# Seção 8: Governance and RBAC

## 81. Entendendo sobre Role Based Access Control (RBAC)

- RBAC = Role Based Access Control
- para delegar funções e permissões para usuarios especificos
- Semelhante do AD, mas agora para os Recursos do Azure (VMs, storagens, etc)
- Exemplos de Roles:
    - Owner: full access + user + permissionar
    - Contributor: full access + user
    - Reader: read access (ex: para user q vai fazer monitoramento)

https://docs.microsoft.com/en-us/azure/role-based-access-control/overview

## 82. Configurando RBAC

- Lab: criar Grupo: webapp (monitorar), somente READ
    - vai no AAD
        - add group
        - add users ao grupo
    - em Resource Group, editar um
        - no submenu Access Contorl (IAM)
        - add Role assignment
            - seleciona a Role: Owner ou Contributor ou Reader
            - Assign access to (no q tipo a role sera associada): AD user, group, or service principal
            - seleciona o user ou group ou etc


## 83. Conceitos de RBAC Policy

Criar permissão de poder fazer coisas específicas. Ex: permitir se um grupo so possa criar VM em uma região indicada.


## 84. Aplicando RBAC Policy

Lab: em um RG, no submenu Polices, cria uma politica de somente deixar criar recursos em uma região. 
Testa criar um recurso em uma região diferente, ao processa retorna erro de q a politica não permitiu; 

## 85. Recurso de Lock

- Trava de seguranca para nao deletar recursos acidentalmente
- Sempre coloque em PROD para não ter problemas acidental
- dois tipos:
    - Delete: nao delete, mas pode add recursors
    - Read-Only: nao delete e nao addd recurso


## 86. Configurando Lock

- No RG, no submenu Locks e add um lock
    - nome e descricao
    - Lock Typo: Read-Only ou Delete
