# Seção 6: Networking e Scaling

## 48. Conceitos sobre VNet e suas funcionalidades


## 49. Hands On - Criando a Vnet e Seguimentando as redes

- Vnet
    - ResourceGroup: Free300NetWorkGroup
        - Vnet: ProjetosVNet 172.16.0.0/16
            - SubA: 172.16.1.0/24
            - SubB: 172.16.2.0/24


## 50. Endereços Privados e Publicos na Azure

- IP Address:
    - IPv4 - 32bits -> 4.2 bilhoes
    - IPv6 - 128bits -> 10 decatrilhoes
- IPs Private
    - A: `10.0.0.0` ~ `10.255.255.255` => Privado
    - B: `172.16.0.0` ~ `172.31.255.255` => Privado
    - C: `192.162.0.0` ~ `192.168.255.255` => Privado
- IPs Public
    - qlqr ip q nao seja do ranges do private

## 51. Hands On - Criando a segunda subnet na VNET

- IPs reservados:
    - `172.16.1.0` -> a propria network
    - `172.16.1.1` -> reservado Azure 
    - `172.16.1.2` -> reservado Azure
    - `172.16.1.3` -> reservado Azure
    - `172.16.1.4` -> será o primeiro atribuido a algo
    - `172.16.1.255` -> broadcast



## 52. Hands On - Testando conectividade entre Subnets

- cria 2 VMs, e na aba network é so selecionar a SubA para a VM1 e a SubB para a VM2
- abre as VM e faz ping para os IP privado de um para outro


## 53. Hands On - Criando VNets utilizando a Linha de Comando (CloudShell)

https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-cli
https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-powershell

````powershell
# Cria o VirtualNetwork
$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName Free300NetWorkGroup `
  -Location 'Brazil South' `
  -Name ProjetosVNet2 `
  -AddressPrefix 10.0.0.0/24

# Cria a SubNet 
$subnetConfig = Add-AzVirtualNetworkSubnetConfig `
  -Name SubC `
  -AddressPrefix 10.0.0.0/24 `
  -VirtualNetwork $virtualNetwork
# Associa a SubNet criada ao VirtualNetwork 
$virtualNetwork | Set-AzVirtualNetwork
````

````cloudshell
az network vnet create \
  --resource-group Free300NetWorkGroup \
  --name ProjetosVNet2 \
  --subnet-name SubC
````


## 54. Conceitos de Roteamento na Microsoft Azure

- Routing:
    - Roteamentos padroes:
        - 1º Dentro da Vnet, as VMs inter-Subnet se enxergam pela Implicit Routing
        - 2º e as VM acessam a internt via um Internet Gateway
        - 3º ai a empresa fisica podem se conectar a VNet da Azure (como via VPN) pelo VNet Gateway
    - Se quiser criar um firewall para q todo o trafego q saia da Vnet passe por ele, terá q Rotear (UDR - User Define Routing)

## 55. Hands On - Configurando Roteamento

- Na Home procurar por "Route table", e crie-o (nome: "Routing-Firewall").
- Para criar uma regra
    - Adiciona uma rota: 
        - nome "Internet-via-firewall"
        - Address prefix "0.0.0.0/0"
        - Next hop type: Virtual appliance (ie, q deve ir para um IP)
            - Virtual network gateway: para uma network gateway
            - Virtual network: para uma outra network
            - Internet: para a internet mesmo
            - Virtual appliance: para um ip especifico
            - Nome: para lugar nenhum, anulado o acesso
        - Next hop address: o ip destino 172.16.10.1
- associa esta Route table a uma subnet
    - No sub menu subnet
    - associa a um VNet e a um SubNet


## 56. Hands On - Configurando Peers entre Vnets

Para conectar duas VM de VNet diferente, tem q habilitar o sistema de Peering

- topologia atual:
    - ProjetosVNet
        - SubA: 172.16.1.0/24
            - VM1
        - SubB: 172.16.2.0/24
            - VM2
    - ProjetosVNet2
        - SubC: 10.0.0.0/24
            - VM3

- No menu Virtual Networks > seleciona um VNet > no submenu Peerings > cria um novo peering:
    - Name of the peering from ProjetosVNet to remote virtual network: VNet1toVNet2
    - Virtual Network: ProjetosVNet2
    - Name of the peering from ProjetosVNet2 to ProjetosVNet: VNet2toVNet1
    - Configurar 2ways ou semente uma ida e sem volta?
        - Configure virtual network access settings
            - Allow virtual network access from ProjetosVNet to ProjetosVNet2: Disabled/Enabled
            - Allow virtual network access from ProjetosVNet2 to ProjetosVNet: Disabled/Enabled
    - Permitir q se um conexão entrar pela VNet1 mas tem destino a um ip do VNet2, pode deixar encaminhar para a VNet2?
        - Configure forwarded traffic settings
            - Allow forwarded traffic from ProjetosVNet2 to ProjetosVNet: Disabled/Enabled
            - Allow forwarded traffic from ProjetosVNet to ProjetosVNet2: Disabled/Enabled
    - Se no VNet2 tem um gateway (ex: q vai para a empresa) se forwarded enabled acima, pode deixar encaminha para o gateway?  
        - Configure gateway transit settings
            - Allow gateway transit: Disabled/Enabled
- assim criando dois peer, um no VNet1 e outro no VNet2 


## 57. O que é Network Security Groups


## 58. Hands On - Configurando Network Security Group


## 59. Hands On - Configurando Network Watcher em Windows Server 2019


## 60. Conexões tipo S2S e P2S VPN com a Azure


## 61. Utilizando o Express Route da Azure


## 62. Conceitos de Load Balancer


## 63. Hands On - Preparando o Lab para Load Balancer


## 64. Hands On - Configurando Load Balancer para Servidores Web


## 65. Removendo o Resource Group


