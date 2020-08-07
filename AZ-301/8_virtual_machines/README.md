# Seção 8: Virtual Machines

> Repetido totalmente do [AZ-300 - Seção 5: Virtual Machines](../../AZ-300/05_virtual_machines/README.md)


## 44. O que é uma Virtual Machine (VM)

VM (Máquinas Virtuais) do Azure é um dos vários tipos de recursos de computação sob demanda escalonáveis oferecidos pelo Azure. Normalmente, você escolhe uma VM quando precisar de mais controle sobre o ambiente de computação do que as outras opções oferecem. Este artigo fornece informações sobre o que você deve considerar antes de criar uma VM, como criá-la e como gerenciá-la.

Uma VM do Azure oferece a flexibilidade da virtualização sem a necessidade de comprar e manter o hardware físico que a executa. No entanto, você ainda precisa manter a VM executando tarefas, como configurar, corrigir e instalar o software que será executado nela.

Máquinas virtuais do Azure podem ser usadas de várias maneiras. Alguns exemplos são:

- Desenvolvimento e teste – as VMs do Azure oferecem uma rápida e maneira fácil de criar um computador com configurações específicas, necessárias para codificar e testar um aplicativo.
- Aplicativos na nuvem – como a demanda por seu aplicativo pode flutuar, pode fazer sentido, em termos econômicos, executá-lo em uma VM no Azure. Você paga por VMs extras quando precisa delas e as desliga quando não são necessárias.
- Datacenter estendido – máquinas virtuais em uma rede virtual do Azure podem ser facilmente conectadas à rede de sua organização.

O número de VMs que o aplicativo usa pode ser escalado verticalmente e horizontalmente para atender às suas necessidades.


## 45. Tipos de Virtual Machine

https://azure.microsoft.com/pt-br/pricing/details/virtual-machines/linux/

- VM Tier:
    - A: basic -> para teste e desenvolvimento
    - B: Burstable -> pode dar um boost, cpu variável, qdo nao uso total, nao gasta creditos
    - D: General purpose -> para storage
    - E: Memory -> para muita memoria
    - F: CPU -> para muitos cores de cpu
    - G: Godzilla -> instancias gigantes
    - H: High Performace compute -> cientistas gostam de usar, com muito poder processamento
    - L: Storage I/O -> 
    - M: Large Memory -> muiiitaaa memoria, até +3teras
    - N: GPU
    - SAP Hana: nao documentado


## 46. Azure Compute Unit - ACU's

https://docs.microsoft.com/pt-br/azure/virtual-machines/acu

- ACU's - Azure Compute Unit => Velocidade de processamento
    - unidade q a Azure criou para demonstrar a velocidade
        - 2 x cpu(A0) = 2 x 50 = 100
        - 2 x cpu(A2) = 2 x 100 = 200 (duas vezes mais rapido q a A0)


## 47. Hands On - Criando sua Primeira VM Windows 2019 na Azure

- Criando uma VM:
    - Basics
        -Project details
            - Subscription
            - resource groups
        - Instance details
            - Virtual machine name: Win2019server
            - Region
            - Availabity option (redundancia) (zona ou set (em hack de data center diferentes))
            - Image: Windows server 2019 datacenter
            - Azure Spot instance
            - Size: B2s (2vCPU, 4GB RAM, R$ 222.28/mes)
        - Administrator account
            - Username: AzureUser
            - Password
        - Inbound port rules
            - Public inbound ports: Allow selected ports 
            - Select inbound ports: RDP (3389)
        - Save money
            - Save up to 49% with a license you already own using Azure Hybrid Benefit. Learn more
            - Already have a Windows Server license? No
    - Disk
        - Disk options
            - OS disk type: Premium SSD
            - Encryption type
            - Enable Ultra Disk compatibility: No
        - Data disks
            - add outros discos
    - Network 
        - Network interface
            - redes virtuais
        - Load balancing
    - Management
        - Monitoring
            - Boot diagnostics: on
            - OS guest diagnostics: off
        - Identity
            - System assigned managed identity: off
        - Auto-shutdown
            - Enable auto-shutdown: off
        - Backup
            - Enable backup: off
    - Advanced
        - Extensions
        - Custom data
        - Host
        - Proximity placement group
        - VM generation
    - Tags


## 48. Hands On - Acessando Remotamente via RDP a VM Windows 2019 Server

````powershell
Get-AzVM
# ResourceGroupName          Name    Location       VmSize  OsType              NIC ProvisioningState Zone
# -----------------          ----    --------       ------  ------              --- ----------------- ----
# FREE300_VM        Win2019server brazilsouth Standard_B2s Windows win2019server272         Succeeded
````

No menu Connection baixa o `.RDP` file para abrir o RDP

ou pelo ps:

````powershell
Get-AzRemoteDesktopFile -ResourceGroupName Free300_VM -Name Win2019server -Launch
````


## 49. Hands On - Criando uma VM Linux na Azure

- LinuxUbuntuServer
- Ubuntu Server 18.04 LTS
- B2s
- SSH
    - user: AzureUser


## 50. Hands On - Acessando Remotamente sua VM Linux Ubuntu

````bash
ssh -i LinuxUbuntuServer_key.pem AzureUser@191.232.179.246
````


## 51. As Caracteristicas de Storage para uma Virtual Machine

- Data Redundancy:
    - LRS:
        - Local Redundancy Storage. (mesmo data center, mas hacks diferentes?)
        - Replicar sua instancia para SSUnit (Storage Scale Unit). 
        - 99.99999999999% (11'9) de um arquivo nao estar corrompido;
    - ZRS:
        - Zona Redundancy Storage.
        - Replica em Zonas (availa. zone / data centers) desta Região.
        - 99.999999999999% (12'9) de durabilidade
    - GRS:
        - Geo Redundancy Storage.
        - em regions diferentes, mas somente em 1 Availa Zone de cada Regiao
        - uma mestre e o resto replica 
        - nao consegue ler as replicas
    - RA-GRS:
        - agora consegue ler as outras regioes tbm
    - GZRS:
        - Geo-Zone Redundancy Storage.
        - armazena em varios Availa Zone de Regioes diferentes 
        - uma mestre e o resto replica, mas nao consegue ler as replicas
    - RA-GZRS:
        - agora consegue ler as outras avail zones das regioes tbm


## 52. Hands On - Adicionando uma Unidade de Storage no Windows Server 2019

- Disks:
    - Disk details
        - Disk name
        - Regions
        - availability zone
        - Source type
            - snapshot: a partir de outro disk ja criado
            - blob storage: transforma um blob storage em um disk
            - none: em branco
        - Size


## 53. Entendo sobre o Sistema de Disk Caching

forma me melhorar a performace de VHD, utilizando a RAM e SSD do server executor da VM, tanto pra premium ou standard

- tipos de cache:
    - Read only: latencia -, IOPS +
    - Read Write: latencia +, IOPS -
- tipo de disco para:
    - OS -> win / linux
        - cache default ativado: read-write
        - pode mudar para: read-only (alguns OS nao suportam po causa da latencia), read-write
    - data -> files
        - cache default ativado: none (desabilitado)
        - pode mudar para: none, read-only, read-write


## 54. Hands On - Alterando o Sistema de Caching

!> Disk caching cannot be changed for L-Series and B-series virtual machines. (O cache de disco não pode ser alterado para máquinas virtuais de série L e de série B.)

so ir no attach do Disco na VM, editar e trocar o tipo de cache.


## 55. Hands On - Entendendo e Alterando Configurações de Rede.

a VM é criado um NIC Interface, na qual recebe um ip publico e um ip privado.

Vai na VM, menu Networking e clica no Nerwork Interface para ir para a edicao deste NIC.

No Menu IP Configuration tera os ipconfigs, clica no ipconfig, e nesta tela pode desabilitar ou criar um ip publico e editar o ip privado

DNS server, troca o ip q ele usara para dns


## 56. Aprendendo sobre Availability Set

Plano de contigencia para caso uma data center caia

- Fault Domain: sao os racks, vc escolhe em quantos hacks vai ter a replica
- Update Domain: qdo precisa fazer um update de hardware, ai move-se para outro enquanto faz update


## 57. Hands On - Configurando uma Availability Set para Servidores Linux Ubuntu 18.04

se nao setou qdo criou, entao nao podera alterar depois, somente na criacao da vm da para escolhe esta opcao

- scafollding do teste:
    - Rack 1
        - VM 1
    - Rack 2
        - VM 2

cria a Avaliability Set primeiro, depois qdo criar a VM, escolha no Availability Options para Availability Set e selecione a Availability Set q acabou de criar 


## 58. O que é Scale Set e como funciona

- Scaling set
    - auto scale
        - define uma quantidade minima e maxima de CPU (ex: 2min e 6 max)
        - se a media for >75% ele add mais um server
        - se a media for <50% ele remove um server


## 59. Hands On - Configurando Scale Set com 6 Servidores Web

- procure na home por "Virtual machine scale sets"
- no form de criacao de VM_scaleset, ative a opcao autoscale
- defina o numero minimo e maximo
- Scale OUT: aumenta o numero de replicas
- Scale IN: diminui o numero de replicas
- seleciona o tipo de load balancer
    - via aplicação
    - load balancer autogerado do azure
        - adiciona um


## 60. Hands On - Conectando o Windows a um File Share Storage

cria um Storage account, cria um file share, vai na vm do windows e monta este file share em uma unidade de rede


## 61. Removendo o Resource Group
