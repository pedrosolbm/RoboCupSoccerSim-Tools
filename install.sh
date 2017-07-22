#!/bin/bash

alias sleep='/bin/sleep';
WORK_PATH="/usr/src/rcss-tools/";
sudo mkdir -vp "$WORK_PATH";
sudo updatedb


MAIN_MESSAGE(){
	echo "--------------------------------------------------------------------------";
	echo "Instalando dependencias para RoboCup Soccer Simulator";
	echo -e "--------------------------------------------------------------------------\n";
	sleep 1;
}

UPDATE_UBUNTU_16_04 (){
#Instala todas as dependencias necessarias para a configuração e instalação dos componentes do RCSS-TOOLS
	DEPS="automake -j $(cat /proc/cpuinfo | grep processor | wc -l) autoconf libtool g++ flex libboost-all-dev libqt4-dev zlib1g-dev libglib2.0-dev libaudio-dev libxt-dev libpng12-dev libxi-dev libxrender-dev libfontconfig1-dev libclang1-3.6 bison++"
	echo "";
	echo "sudo apt-get update && upgrade";
	echo "";
	sleep 1;

	sudo apt-get update && sudo apt-get upgrade -y;

	echo "";
	echo "sudo apt-get install -y $DEPS";
	echo "";
	sleep 1;

	sudo apt-get install -y "$DEPS";

	echo "--------------------------------------------------------------------------";
	echo "Dependências para RoboCup Soccer Simulation foram instaladas!";
	echo -e "--------------------------------------------------------------------------\n";


}


INSTALL_LIBRCSC(){ 
	INSTALLED=$(locate rcsc |egrep -v "home|rcss-tools" | wc -l);
	LIB="librcsc-"
	LIB_VERSION="4.1.0"
	LIB_FORMAT=".tar.gz"

	LIB_PATH="/etc/ld.so.conf"
	LIB_SHARE="include /usr/local/share"


	echo "--------------------------------------------------------------------------"
	echo "Instalando librcsc"
	echo "--------------------------------------------------------------------------"
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
		if [ -e $LIB$LIB_VERSION$LIB_FORMAT ]
			then

				echo ""
				echo "File [$LIB$LIB_VERISON$LIB_FORMAT] Encontrado."
				echo "Configurando $LIB$LIB_VERSION.."
				echo ""
				sleep 1;
				
				sudo tar -xzf $WORK_PATH$LIB$LIB_VERSION$LIB_FORMAT;
				cd $WORK_PATH$LIB$LIB_VERSION;
				sudo ./configure
				sudo make install;
				cd ..;
				
				echo "";
				echo "$LIB$LIB_VERSION instalado com sucesso.";
				echo "";
				sudo echo -e "$LIB_SHARE" | sudo tee -a $LIB_PATH

			else

				echo "File [$LIB$LIB_VERSION$LIB_FORMAT] não encontrado."
				sleep 1;
				echo "Iniciando download [$LIB$LIB_VERSION$LIB_FORMAT]"
				sleep 1;

				sudo wget --progress=bar http://c3sl.dl.osdn.jp/rctools/51941/librcsc-4.1.0.tar.gz
				
				echo "";
				echo "Configuring $LIB$LIB_VERSION";
				echo "";
				sleep 1;

				sudo tar -xzf $LIB$LIB_VERSION$LIB_FORMAT;
				cd $LIB$LIB_VERSION;
				sudo ./configure
				sudo make install;
				cd ..;

				echo "";
				echo "$LIB$LIB_VERSION instalado com sucesso.";
				echo "";
				sudo echo -e "$LIB_SHARE" | sudo tee -a $LIB_PATH
		fi
		else
			echo "$LIB$LIB_VERSION já existe."
	fi

}
	
INSTALL_SERVER(){
	INSTALLED=$(locate rcss |egrep -v "home|rcss-tools" | wc -l);
	SERVER="rcssserver-"
	SERVER_VERSION="15.3.0"
	SERVER_FORMAT=".tar.gz"

	echo "--------------------------------------------------------------------------";
	echo "Instalando rcssserver";
	echo "--------------------------------------------------------------------------";
	echo "";
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
			if [ -e $SERVER$SERVER_VERSION$SERVER_FORMAT ]
				then

					echo "";
					echo "File [$SERVER$SERVER_VERSION$SERVER_FORMAT] encontrado."
					sleep 1;
					echo "Configurando $SERVER$SERVER_VERSION.."
					echo "";
					sleep 1;

					sudo tar -xzf $SERVER$SERVER_VERSION$SERVER_FORMAT;
					cd $SERVER$SERVER_VERSION;
					sudo ./configure
					sudo make install;
					cd ..;

				else

					echo "File [$SERVER$SERVER_VERSION$SERVER_FORMAT] não encontrado"
					sleep 1;			
					echo "Iniciando download [$SERVER$SERVER_VERSION$SERVER_FORMAT]"
					sleep 1;

					sudo wget --progress=bar http://ufpr.dl.sourceforge.net/project/sserver/rcssserver/15.3.0/rcssserver-15.3.0.tar.gz
					
					sudo tar -xzf $SERVER$SERVER_VERSION$SERVER_FORMAT;
					cd $SERVER$SERVER_VERSION;
					sudo ./configure
					sudo make install;
					cd ..;

			fi

				echo "";
				echo "$SERVER$SERVER_VERSION$SERVER_FORMAT instalado com sucesso.";
				echo "";

			else
				echo "$SERVER$SERVER_VERSION já instalado";
	fi	
}

INSTALL_MONITOR(){

	INSTALLED=$(locate rcsc |egrep -v "home|rcss-tools" | wc -l);
	MONITOR="rcssmonitor-"
	MONITOR_VERSION="15.2.0"
	MONITOR_FORMAT=".tar.gz"

	echo "--------------------------------------------------------------------------";
	echo "Instalando rcsmonitor";
	echo "--------------------------------------------------------------------------";
	echo "";
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
			if [ -e $MONITOR$MONITOR_VERSION$MONITOR_FORMAT ]
				then
					
					echo "";
					echo "File [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT] encontrado."
					sleep 1;
					echo "Configurando $SERVER$SERVER_VERSION.."
					echo "";
					sleep 1;

					sudo tar -xzf $MONITOR$MONITOR_VERSION$MONITOR_FORMAT;
					cd $MONITOR$MONITOR_VERSION;
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					./configure
					sudo sed -i 's/-pthread-lQtGui/-pthread -lQtGui/' config.status* && echo "-pthread-lQtGui CORRIDO!"
			
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;

				else
					
					echo "File [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT] não encontrado"
					sleep 1;			
					echo "Iniciando download [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT]"
					sleep 1;

					sudo wget --progress=bar http://tenet.dl.sourceforge.net/project/sserver/rcssmonitor/15.2.0/rcssmonitor-15.2.0.tar.gz;

					sudo tar -xzf $MONITOR$MONITOR_VERSION$MONITOR_FORMAT;
					cd $MONITOR$MONITOR_VERSION;
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					./configure
					sudo sed -i 's/-pthread-lQtGui/-pthread -lQtGui/' config.status* && echo "-pthread-lQtGui CORRIDO!"
	
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;
					
					echo "";
					echo "$SERVER$SERVER_VERSION$SERVER_FORMAT instalado com sucesso.";
					echo "";
			fi
		else
			echo "$MONITOR$MONITOR_VERSION já instalado"
	fi
}

MAIN_MESSAGE;

echo "Creating directory $WORK_PATH ..."
sleep 1;
echo "Entering directory $WORK_PATH ..."
sleep 1;
cd "$WORK_PATH";
sleep 1;

UPDATE_UBUNTU_16_04;
INSTALL_LIBRCSC;
INSTALL_SERVER;
INSTALL_MONITOR;
