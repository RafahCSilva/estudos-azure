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

- Access Policy
    - Regra geral, se aplicar a tudo no BLOB ou BlobContainer
- SAS
    - Share Access Signature
    - setar a data e time de inicio e fim
    - permissões de Read, Write e Delete

o SAS gerará essa string:
````
Connection string:
    BlobEndpoint=https://rcsfree300storage.blob.core.windows.net/;QueueEndpoint=https://rcsfree300storage.queue.core.windows.net/;FileEndpoint=https://rcsfree300storage.file.core.windows.net/;TableEndpoint=https://rcsfree300storage.table.core.windows.net/;SharedAccessSignature=sv=2019-10-10&ss=b&srt=sco&sp=rwdlacx&se=2020-07-12T11:10:31Z&st=2020-07-12T03:10:31Z&spr=https&sig=etzaijWWSmBiQFXXsLA2bVL7pc9TQwHEOuJbnVN0lk4%3D
SAS token:
    ?sv=2019-10-10&ss=b&srt=sco&sp=rwdlacx&se=2020-07-12T11:10:31Z&st=2020-07-12T03:10:31Z&spr=https&sig=etzaijWWSmBiQFXXsLA2bVL7pc9TQwHEOuJbnVN0lk4%3D
Blob service SAS URL?
    https://rcsfree300storage.blob.core.windows.net/?sv=2019-10-10&ss=b&srt=sco&sp=rwdlacx&se=2020-07-12T11:10:31Z&st=2020-07-12T03:10:31Z&spr=https&sig=etzaijWWSmBiQFXXsLA2bVL7pc9TQwHEOuJbnVN0lk4%3D
````

https://rcsfree300storage.blob.core.windows.net/pics2/happy-epic-win-l.png?sv=2019-10-10&ss=b&srt=sco&sp=rwdlacx&se=2020-07-12T11:10:31Z&st=2020-07-12T03:10:31Z&spr=https&sig=etzaijWWSmBiQFXXsLA2bVL7pc9TQwHEOuJbnVN0lk4%3D



## 23. Hands On - Criando um Storage Account via PowerShell

https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-powershell

- indicar no PS:
    - Resource Group
    - name
    - location
    - kind: stoirage_v2
    - tier: hot/cold
    - skuname: standard_LRS

````powershell
# get o RG name
Get-AzResourceGroup
#   ResourceGroupName : Free300_Storage

# get o location code
Get-AzLocation
#   Location    : brazilsouth
#   DisplayName : Brazil South

# criando o StorageAccount (tab para completar os possiveis values)
New-AzStorageAccount -ResourceGroupName Free300_Storage -Name rcsfree300storage02 -Location 'Brazil South' -SkuName Standard_LRS -Kind StorageV2

# StorageAccountName  ResourceGroupName PrimaryLocation SkuName      Kind      AccessTier CreationTime        ProvisioningState EnableHttpsTrafficOnly
# ------------------  ----------------- --------------- -------      ----      ---------- ------------        ----------------- --------
# rcsfree300storage02 Free300_Storage   brazilsouth     Standard_LRS StorageV2 Hot        12/07/2020 03:44:29 Succeeded         True
````

````cloudshell
az storage account create --name rcsfree300storage03 --resource-group Free300_Storage --location 'Brazil South' --sku Standard_LRS --kind StorageV2
````


## 24. Hands On - Utilizando o AzCopy

https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10

download e unzip o executável


- vai no StorageExplorer
- cria um container no BlobContainer chamado "imagem"
- clica no direito no container imagem > get S.A.S.
    - Container: imagem
    - URI: https://rcsfree300storage02.blob.core.windows.net/imagem?sp=racwdl&st=2020-07-12T03:53:42Z&se=2020-07-13T03:53:42Z&sv=2019-10-10&sr=c&sig=nQ7M1P03d11fJBGq9rjaivV%2FSeNGBK6gzeRxdiI0WIk%3D
    - CopyQuery string: ?sp=racwdl&st=2020-07-12T03:53:42Z&se=2020-07-13T03:53:42Z&sv=2019-10-10&sr=c&sig=nQ7M1P03d11fJBGq9rjaivV%2FSeNGBK6gzeRxdiI0WIk%3D
- executa o comando:

````powershell
# sintaxy do comando
.\azcopy.exe copy "SOURCE" "DESTINE" --recursive

# Source: ".\imgteste\*"
# Destine: URI do Shared Access Signature criado


.\azcopy.exe copy ".\imgteste\*" "https://rcsfree300storage02.blob.core.windows.net/imagem?sp=racwdl&st=2020-07-12T03:53:42Z&se=2020-07-13T03:53:42Z&sv=2019-10-10&sr=c&sig=nQ7M1P03d11fJBGq9rjaivV%2FSeNGBK6gzeRxdiI0WIk%3D" --recursive

# INFO: Scanning...
# INFO: Any empty folders will not be processed, because source and/or destination doesn't have full folder support
# 
# Job 7c14cc05-2619-1b43-5e98-d0ad64b1485d has started
# Log file is located at: C:\Users\RafaelCardoso\.azcopy\7c14cc05-2619-1b43-5e98-d0ad64b1485d.log
# 
# 14.9 %, 3 Done, 0 Failed, 1 Pending, 0 Skipped, 4 Total, 2-sec Throughput (Mb/s): 4.2911
# 
# Job 7c14cc05-2619-1b43-5e98-d0ad64b1485d summary
# Elapsed Time (Minutes): 0.0667
# Number of File Transfers: 4
# Number of Folder Property Transfers: 0
# Total Number of Transfers: 4
# Number of Transfers Completed: 4
# Number of Transfers Failed: 0
# Number of Transfers Skipped: 0
# TotalBytesTransferred: 1072959
# Final Job Status: Completed
````


## 25. Hands On - Adicionando um Sub Dominio ao Storage

- URI gerado pra um blob: https://rcsfree300storage02.blob.core.windows.net/imagem/cereal-guy-cereal-guy-l.png
- este é o dominio do storage: rcsfree300storage02.blob.core.windows.net
- vai no seu gerenciador de Dominios (eu usei o No-IP) criando um CNAME para o dominio da url acima
- no Storage Account selecionar, entra no menu Custom Domain
- escrever o dominio q vc criou
- ir em algum blob e pegar a url assinada (get SAS)
- troca o dominio da MS pelo seu criado
    - https://rcsfree300storage02.blob.core.windows.net/imagem/cereal-guy-cereal-guy-l.png?sp=rl&st=2020-07-12T04:24:50Z&se=2020-07-13T04:24:50Z&sv=2019-10-10&sr=b&sig=NigTZAAwKsW5YWA5A%2FEG6t2hNT7HGKRhn%2Fp0ClB7KGQ%3D
    - https://rcsimage.ddns.net/imagem/cereal-guy-cereal-guy-l.png?sp=rl&st=2020-07-12T04:24:50Z&se=2020-07-13T04:24:50Z&sv=2019-10-10&sr=b&sig=NigTZAAwKsW5YWA5A%2FEG6t2hNT7HGKRhn%2Fp0ClB7KGQ%3D


## 26. O Serviço de Import/Export da Azure

https://azure.microsoft.com/en-gb/services/storage/import-export/
https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-service

- serve para:
    - Data Migration
    - Distribuicao de conteudo
    - Backup archive
    - Recovery

tool para transferir seus dados para HDD (ou SSD) em NTFS+bitlocker, e envia para um dos data-centers mais proximo. Ele copiar para a nuvem e te re-envia de volta o HD.


## 27. Hands On - Hospedando um website estático na Azure

No menu do Storage Account, vai em Static website e habilita e indica os index.

Gerando asism uma URL https://rcsfree300storage02.z15.web.core.windows.net/

vá no novo container q ele criou chamado "$web", faça o upload dos `.html` e por fim acesse a url


## 28. Removendo o Resource Group

Deleta o Resource Group (deletando tudo dentro dela, inclusive os storages accounts) para não gerar mais custo, após terminar esta seção.
