# Seção 6: Business Continuity

> Repetido totalmente do [AZ-300 - Seção 12: Migrações](../../AZ-300/12_migracoes/README.md)


## 39. Utilizando o Azure Site Recovery

- ASR = Azure Site Recovery
- 3 tipos de desaste recovery
    - **High Availability**
        - Uma repica da sua infraestrutura local, e se caso o principal cair, será redirecionado o trafego para essa replica
        - mas essa vai migrar toda a estrutura
    - **Disaster Recovery**
        - se o data center ficar indisponível, todo o trafego será migrado para outro datacenter
    - **Backup**

- A Microsoft converte a VM para VHD, faz o upload para a Azure e monta a image numa VM com a mesma características da anterior
    - o RF (Replication Frequency) configura nela de quanto em quanto tempo (opções: 30sec, 5min ou 15min) ele atualizará as diferençaas entre a original e a réplica 
- O grande intuito do ASR é sempre manter, atraves de alta disponibilidade, a sua empresa funcionando!


## 40. Leitura Complementar - Site Recovery

Sobre o Azure Site Recovery

Como uma organização, você precisa adotar uma estratégia de BCDR (continuidade dos negócios e recuperação de desastres) que mantenha seus dados seguros e seus aplicativos e cargas de trabalho online quando ocorrerem interrupções planejadas e não planejadas.

Os Serviços de Recuperação do Azure contribuem para sua estratégia BCDR:

- **Serviço do Site Recovery**: O Site Recovery ajuda a garantir a continuidade dos negócios mantendo os aplicativos de negócios e as cargas de trabalho em execução durante interrupções. O Site Recovery replica as cargas de trabalho em execução em máquinas físicas e virtuais (VMs) de um site primário para um local secundário. Quando uma interrupção ocorre no seu site primário, você faz failover para o local secundário e acessa os aplicativos a partir daí. Depois que a localização primária estiver novamente em execução, você poderá fazer failback a ela.
- **Serviço de Backup**: O serviço [Backup do Azure](https://docs.microsoft.com/pt-br/azure/backup/) mantém seus dados seguros e recuperáveis.

O Site Recovery pode gerenciar a replicação para:

- VMs do Azure que replicam entre regiões do Azure.
- VMs locais, VMs do Azure Stack e servidores físicos.


## 41. Utilizando o Azure Migrate

- Ferramenta para fazer a migração da Física para a Cloud
- Instala uma VM no server local, e esta envia metadados para o Azure Migrate Service, e assim gera a estimativa 
- As 4 analises q a ferramenta faz:
    - **Assess Azure Readness**
        - Validar se a estrutura física atual é compatível com a Azure
    - **Sizing**
        - Analise se o tamanho atual é o suficiente
        - Ex: analisa o uso de RAM, se tinha 16GB, mas nos últimos meses só usou 7GB, então 8GB é o suficiente
        - COMFORT FACTOR:
            - Ex: se local tem 10cores e so usou 20%, entao 2cores é suficiente (mas estará 2cores a 100%)
            - o fator de conforto adiciona uma gordurinha para o destino
            - A Azure recomenda 1.3 (30% a mais)
                - resultando em 2,6cores ~ 3 cores, recomentando assim 4cores (pq nao tem VM de 3cores)
    - **Cost Estimation**
        - Estimar o quanto era usado no local e quanto usará no Cloud (cloud é menor$, pq local usar energia, manutenção, hardware etc)
        - Para a empresa avaliar se vale apena
    - **Dependency Mapping**
        - Mapear as dependências das suas VM locais, para que seja migrado na ordem e grupo correto, sem quebrar a dependências
- https://docs.microsoft.com/en-us/azure/migrate/migrate-services-overview
    - https://docs.microsoft.com/pt-br/azure/migrate/migrate-services-overview
    - Veja o que a ferramenta faz:
    - **Azure readiness / Preparação para o Azure**: avalia se os computadores locais estão prontos para a migração para o Azure.
    - **Azure sizing / Dimensionamento do Azure**: estima o tamanho das VMs do Azure ou o número de nós VMware do Azure após a migração.
    - **Azure cost estimation / Estimativa de custo do Azure**: Estima custos para a execução de computadores locais no Azure.
    - **Dependency analysis / Análise de dependência**: identifica dependências entre servidores e estratégias de otimização para mover servidores interdependentes para o Azure. Saiba mais sobre a Avaliação do Servidor com a análise de dependência.
