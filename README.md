<Obrigado, mago @hebertluiz pela ajuda com os scripts>
# RoboCupSoccerSim-Tools
Esse repositório tem o objetivo de ajudar iniciantes a instalar as ferramentas e dependências necessárias para a RoboCup Soccer Simulation

Componentes instalados
----------------------

Componentes | Descrição
----------------------
rcssserver | Servidor que faz a conexão entre os times e o monitor
rcssmonitor | Monitor do jogo

Dependências necessárias
-------------------------
Estas são todas as dependências necessárias e automaticamente instaladas pelo script de instalação
* automake
* autoconf
* libtool
* g++
* flex
* libboost-all-dev
* libqt4-dev zlib1g-dev
* libglib2.0-dev
* libaudio-dev
* libxt-dev
* libpng12-dev
* libxi-dev
* libxrender-dev
* libfontconfig1-dev
* libclang1-3.6


Configurando e Instalando RCSS-TOOLS
------------------------------------
Para instalar o ambiente RCSS basta copiar e colar os comandos a baixo num terminal com diretório de sua escolha
<pre><code>git clone https://github.com/pedrosolbm/RoboCupSoccerSim-Tools.git
cd RoboCupSoccerSim-Tools/
./install.sh
</code></pre>

Caso o arquivo não tenha permissão para ser executado, conceda permissão de execução para o arquivo usando o comando <code>chmod +x install.sh</code> e execute novamete: <code>./install.sh</code>

Desinstalando RCSS-TOOLS
------------------------
Para desinstalar o RCSS-TOOLS basta executar <code>./uninstall.sh</code> que ele removerá todos os arquivos e pastas criados na instalação

Caso o arquivo não tenha permissão para ser executado, conceda permissão de execução para o arquivo usando o comando <code>chmod +x uninstall.sh</code> e execute novamete: <code>./uninstall.sh</code>

Distribuições Compatíveis
-------------------------
- [x] Ubuntu 16.04

Agradecimentos
--------------
Obrigado, [@hebertluiz](https://github.com/hebertluiz) pela ajuda para montar o script!
