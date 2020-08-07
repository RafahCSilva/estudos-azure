# Seção 9: Docker e App

> Repetido totalmente do [AZ-300 - Seção 11: Apps e Containers](../../AZ-300/11_apps_e_containers/README.md)


## 62. O que é Docker

## 63. Instalando o Docker na sua maquina local

## 64. Instalando o Git na sua maquina Local

## 65. Criando o Azure Container Registries

- No menu Container Registries
- Cria um Container Registry
    - em Access keys, habilita o Admin user para aparecer o user e senha
- no local, builda sua imagem com o paramento da URL:
    - clore repo do lab https://github.com/clubecloudcom/demo-app
    - Build image: 
        - `docker build -t primeirotest.azurecr.io/demo-app:latest .`
            - `-t` = `--tag` => `nama`:`tagVersion`
    - Faça login no ContainerRegistry (repositorio tipo "Docker Hub" q vc acabou de criar no Azure):
        - `docker login primeirotest.azurecr.io`
        - use as credenciais do Access Keys
    - Faça o upload da imagem:
        - `docker push primeirotest.azurecr.io/demo-app:latest`


## 66. Testando a Aplicacao dentro do Docker

- no menu Web App
- Criar um novo app do tipo Docker, e na aba Docker:
    - indicar q a image esta no Azure Container Registry
    - qual a imagem: demo-app
    - e a tag: latest


## 67. Removendo o Resource Group
