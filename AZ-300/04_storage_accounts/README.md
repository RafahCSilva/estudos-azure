# Seção 4: Storage Accounts

## 18. O que é a Storage Account?

https://azure.microsoft.com/en-us/services/#storage
(ou https://azure.microsoft.com/en-us/ > Menu > Products > Storage)

- Blob Storage:
    - não tem limites de tamanho
    - Bucket (~ AWS S3)
    - videos, pic, docs
    - Streaming
    - backup
    - não tem permissions
    - não tem estrutura (bacia)
- File Storage
    - Share txt, xlsx, docx...
    - montagem (linux, mac, win)
    - azure FIle Sync
- Table Storage
    - noSQL
    - Odata
    - Linq queries
    - tabelas simples estruturada
- Queue Storage
    - filas


## 19. Detalhes sobre cada Storage Account

https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
https://azure.microsoft.com/pt-br/pricing/details/storage/

- Account Kind:
    - GPv1 -> General Propose version 1
        - antiga
        - nao Access tier (default): Cool or Hot
    - GPv2 -> General Propose version 2
        - novo
    - BlobStorage
        - blob

- Tier: (https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers)
    - Hot  = acesso com maior frequencia (doc, video, xls)
    - Cold = acesso com menor frequencia (backup, archive), cobra por charge

- Replication: (https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy)
    - (LRS) Locally-redundant storage
        - guardado no mesmo data center uma cópia
    - (ZRS) Zone-redundant storage
        - guardado em zonas diferentes uma cópia
    - (GRS) Geo-redundant storage
        - guardado em regiões diferentes uma cópia
    - (RA-GRS) Read-access geo-redundant storage
        - idem e acesso de leitura na copia
    - (GZRS) Geo-zone-redundant storage
    - (RA-GZRS) Read-access geo-zone-redundant storage
        - idem e acesso de leitura na copia

- Performace: (https://docs.microsoft.com/en-us/azure/storage/common/scalability-targets-standard-account)
    - Standard -> mais barata (-$), em HD
    - Premium -> mais cara (+$), em SSD


## 20. Hands On - Criando um Storage Account

- Tip: 
    - criar uma RG separada para esse Lab de storage
    - cria tudo nessa RG
    - ao final do LAB, deleta o RG para deletar tudo junto


## 21. Hands On - Utilizando o Azure Storage Explorer

Download: https://azure.microsoft.com/pt-br/features/storage-explorer/



## 22. Hands On - Adicionando Access Policy Storage


## 23. Hands On - Criando um Storage Account via PowerShell


## 24. Hands On - Utilizando o AzCopy


## 25. Hands On - Adicionando um Sub Dominio ao Storage


## 26. O Serviço de Import/Export da Azure


## 27. Hands On - Hospedando um website estático na Azure


## 28. Removendo o Resource Group

