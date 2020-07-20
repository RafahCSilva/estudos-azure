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

- NSG: Network Security Groups
- network filter (firewall simples)
- Permit / Deny por: 
    - Protocolos
    - port number
    - source/dest IP address
- por Inbound/Outbound (entrada ou saida)
- pode ser aplicado na NIC (VM) ou a Subnet


## 58. Hands On - Configurando Network Security Group

- Exercicio: Deny ping da VM1 para VM2 (mesma VNet, mas SubNet diferentes)
- No menu, Network security groups
- cria um NSG
- edita a NSG criada para add alguma rule
    - Priority: 0 é maior prioridade, +inf é menor prioridade
    - se uma rule permitir, ele parará de match as seguintes
- ao add uma in/outbound rule:
    - Source/Destination pode ser: qlqr um, um ip, um service tag ou um Application security group
    - Source/Destination port
    - Protocol: Any, TCP, UDP, ICMP(ping)
    - Priority number
    - name


## 59. Hands On - Configurando Network Watcher em Windows Server 2019

- Network Watcher, para monitoriar detalhes de conexoes na sua topologia (deve ser habilitado na regiao q estiver)
    - **Connection monitor**:
        - cria um Monitor de conexao com a origem e destino de alguma VM e sua porta
        - criando grafico da visualizacao especifica q vc aapontar
    - **Network Performance Monitor**
        - visualizar a performace para cada VM
    - **IP flow verify**
        - inputa origem e destino e verifica em ql regra cai, ajuda a verificar problemas de rules, por qual rule esta passando
        - Network Watcher IP flow verify checks if a packet is allowed or denied to or from a virtual machine based on 5-tuple information. The security group decision and the name of the rule that denied the packet is returned.
            - O fluxo IP do Network Watcher verifica se um pacote é permitido ou negado para ou de uma máquina virtual com base em informações de cinco tuplas. A decisão do grupo de segurança e o nome da regra que negou o pacote são retornados.
    - **Next hop**
        - verifica para por onde o trafego esta indo, ql VNet ou gateway
        - Next Hop provides the next hop from the target virtual machine to the destination IP address.
            - O Próximo salto fornece o próximo salto da máquina virtual de destino para o endereço IP de destino.
    - **Effective security rules**
        - lista quais regras esta habilitada para um VM, listando todas
    - **Packet capture** (WireShark virtual das vm)
        - Capturar todos os pacotes (in e out) q trafegarem em uma VM, analogo ao WireShark, salvando no blobstorage
    - **Connection troubleshoot**
        - Testa se é possivel conectar de um VM (ou app Gateway) para outro IP (ou VM)


## 60. Conexões tipo S2S e P2S VPN com a Azure

- S2S = Site-to-Site VPN
    - Fisica
        - Router ou firewall
            - usa uma conexao de IPsec, com IKE1 e IKE2 para a *VPN Gateway*, encriptando o trafego
- P2S = Ponti-to-site
    - de um ponto (no PC) para o VPN Gateway (via um SSTP tunnel)
- Express Route = office_fisico + cloud


## 61. Utilizando o Express Route da Azure

https://docs.microsoft.com/en-us/azure/expressroute/expressroute-introduction

- Express Route = office_fisico + cloud
    - melhor solucao para migracao
    - no seu parceiro ISP, contrata um link dedicado da emprsa fisica até o ISP, e o IPS do mesmo parceiro chega até os datacenter da azure, e entre o ISP tem o express Route Circuit Primaty (e o secondary)
        - Como os links sao dedicados da empresta até a azure, tem velocidade full contratada e melhor desemprenho
    - se o office fisico ja se conecta a um DataCenter, e o data center ao azure, isso se chama Cloud Exchange Co-location 
- Point-to-Point Ethernet Connection
    - a provedora liga o office ao cloud
- Any-to-Any Connection
    - se varios offices estao interconectados por um WAN (conexao em anel)
    - Coloca um Express Route ligando o anel ao Cloud


## 62. Conceitos de Load Balancer

- Load Balancer
    - ele trabalha na camada 4 (layer 4)
    - Probes -> monitora as VM atras dele, assim configura um timeout e se ele ver q nao responde, ele para de enviar trafego para esta
    - auto-reconfiguration -> se o LB estiber apontando para uma Availability Set, ao entrar/sair uma nova VM, ele se auto configurará para recebe-lo na sua distribuicao de trafego 
    - Hash Based Distribution
        - Olha 5ponto para descidir para ql VM ele vai distribuir a requisição, e manterá para as requisicoes seguintes desta mesma tupla 
        - 5-tupla hash
            - Source IP
            - Dest IP
            - Source Port
            - Dest Port
            - Protocol
        - tanto com Private ou Public IP (privado qdo é um LB entre VM e DB replicados)

## 63. Hands On - Preparando o Lab para Load Balancer


## 64. Hands On - Configurando Load Balancer para Servidores Web


## 65. Removendo o Resource Group


