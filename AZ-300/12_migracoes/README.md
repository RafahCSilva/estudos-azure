# Seção 12: Migrações

## 103. Azure Migrate

- Ferramenta para fazer a migração da Física para a Cloud
- Instala uma VM no server local, e esta envia metadados para o Azure Migrate Service, e assim gera a estimativa 
- As 4 analises q a ferramenta faz:
    - **Assess Azure Readness**
        - Validar se a estrutura física atual é compatível com a Azure
    - **Sizing**
        - Analise se o tamanho atual é o sufiente
        - Ex: analisa o uso de RAM, se tinha 16GB, mas nos últimos meses só usou 7GB, então 8GB é o suficiente
        - COMFORT FACTOR:
            - Ex: se local tem 10cores e so usou 20%, entao 2cores é suficiente (mas estará 2cores a 100%)
            - o fator de conforto adicona uma gordurinha para o destino
            - A Azure recomenda 1.3 (30% a mais)
                - resultando em 2,6cores ~ 3 cores, recomentando assim 4cores (pq nao tem VM de 3cores)
    - **Cost Estimation**
        - Estimar o quanto era usado no local e quanto usará no Cloud (cloud é menor$, pq local usar energia, manutencao, hardware etc)
        - Para a empresa avaliar se vale apena
    - **Dependency Mapping**
        - Mapear as dependencias das suas VM locais, para que seja migrado na ordem e grupo correto, sem quebrar a dependencia
- https://docs.microsoft.com/en-us/azure/migrate/migrate-services-overview
    - https://docs.microsoft.com/pt-br/azure/migrate/migrate-services-overview
    - Veja o que a ferramenta faz:
    - **Azure readiness / Preparação para o Azure**: avalia se os computadores locais estão prontos para a migração para o Azure.
    - **Azure sizing / Dimensionamento do Azure**: estima o tamanho das VMs do Azure ou o número de nós VMware do Azure após a migração.
    - **Azure cost estimation / Estimativa de custo do Azure**: Estima custos para a execução de computadores locais no Azure.
    - **Dependency analysis / Análise de dependência**: Identifica dependências entre servidores e estratégias de otimização para mover servidores interdependentes para o Azure. Saiba mais sobre a Avaliação do Servidor com a análise de dependência.


## 104. Azure Site Recovery

- ASR = Azure Site Recovery
- 3 tipos de desaste recovery
    - High Availability
        - Uma repica da sua infraestrutura, e se caso o principlar cair, será redirecionado o trafego para essa replica
        - mas essa vai migrar toda a estrutura
    - disaster Recovery
        - se o data center ficar indisponivel, todo o trafego será migrado para outro datacenter
    - Backup

- A Microsoft converte a VM para VHD, faz o upload para a Azure e monta a image numa VM com a mesma caracteristicas da anterior
    - o RF (Replication Frequency) configura nela de quanto em quanto tempo ele atualizará as differencas entrar as VMs 
