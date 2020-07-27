# Seção 13: Automação

## 105. Conceitos de Custom Images

Cria uma VM, configura tudo q vc precisa nela, e gera uma imagem.
Para subir outras VMs apartir desta imagem e ter essa configuracao pronta 

## 106. Hands On - Criando uma Versão Customizada do Windows 2019

- Roda uma ferramente para rodar seus scripts
    - Win: SysPrep
    - Linux: sudo waagent

- Sobre uma VM de Win2019
    - instala e configura tudo q precisar 
    - executa o `C:\Windows\System32\Sysprep\sysprep.exe`
        - seleciona para desligar ao terminar
        - assim preparando o SO para se tormar uma imagem
        - (essa tool otimiza o SO e remove os user, reiniciando a instalação deste)
- na listagem de VMs, qdo estiver stopped
    - no botao Capture
    - indica o nome desta imagem
    - se deseja deletar a VM apos criar a imagem
        - Pois apos finalizar isso, a VM nao poderá mais ser utilizada
- Cria uma nova VM usando esta image
    - via EDP, verá q os servicos estarão funcionado como configurado
    - mas como é um usuario diferente nesta nova VM, os arquivos anteriores do usuário da primeira VM nao existem mais 
