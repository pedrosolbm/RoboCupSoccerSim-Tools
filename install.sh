#!/bin/bash

alias sleep='/bin/sleep';
WORK_PATH="/usr/src/rcss-tools/";
sudo mkdir -vp "$WORK_PATH";
sudo updatedb
MAIN_MESSAGE(){
	echo "--------------------------------------------------------------------------";
	echo "Installing RoboCup Soccer Simulator Tools";
	echo -e "--------------------------------------------------------------------------\n";
	sleep 1;
}

UPDATE_UBUNTU_16_04 (){
#Instala todas as dependencias necessarias para a configuração e instalação dos componentes do RCSS-TOOLS
	DEPS="automake -j $(cat /proc/cpuinfo | grep processor | wc -l) autoconf libtool g++ flex libboost-all-dev libqt4-dev zlib1g-dev libglib2.0-dev libaudio-dev libxt-dev libpng12-dev libxi-dev libxrender-dev libfontconfig1-dev"
	echo "";
	echo "sudo apt-get update && upgrade";
	echo "";
	sleep 1;

	sudo apt-get update && sudo apt-get upgrade -y;

	echo "";
	echo "sudo apt-get intall -y $DEPS";
	echo "";
	sleep 1;

	sudo apt-get install -y "$DEPS";

	echo "--------------------------------------------------------------------------";
	echo "RoboCup Soccer Simulation Enviroment was successfully installed!";
	echo -e "--------------------------------------------------------------------------\n";


}


INSTALL_LIBRCSC(){ 
	INSTALLED=$(locate rcsc |egrep -v "home|rcss-tools" | wc -l);
	LIB="librcsc-"
	LIB_VERSION="4.1.0"
	LIB_FORMAT=".tar.gz"
	
	echo "--------------------------------------------------------------------------"
	echo "Installing librcsc"
	echo "--------------------------------------------------------------------------"
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
		if [ -e $LIB$LIB_VERSION$LIB_FORMAT ]
			then

				echo ""
				echo "File [$LIB$LIB_VERISON$LIB_FORMAT] found."
				echo "Configuring $LIB$LIB_VERSION.."
				echo ""
				sleep 1;
				
				sudo tar -xzf $WORK_PATH$LIB$LIB_VERSION$LIB_FORMAT;
				cd $WORK_PATH$LIB$LIB_VERSION;
				sudo ./configure
				sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
				cd ..;
				
				echo "";
				echo "$LIB$LIB_VERSION was successfully installed!";
				echo "";

			else

				echo "File [$LIB$LIB_VERSION$LIB_FORMAT] not found."
				sleep 1;
				echo "Starting [$LIB$LIB_VERSION$LIB_FORMAT] download.."
				sleep 1;

				sudo wget -q --show-progress http://c3sl.dl.osdn.jp/rctools/51941/librcsc-4.1.0.tar.gz
				
				echo "";
				echo "Configuring $LIB$LIB_VERSION";
				echo "";
				sleep 1;

				sudo tar -xzf $LIB$LIB_VERSION$LIB_FORMAT;
				cd $LIB$LIB_VERSION;
				sudo ./configure
				sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
				cd ..;

				echo "";
				echo "$LIB$LIB_VERSION was successfully installed!";
				echo "";
		fi
		else
			echo "$LIB$LIB_VERSION already installed!"
	fi
}
	
INSTALL_SERVER(){
	INSTALLED=$(locate rcss |egrep -v "home|rcss-tools" | wc -l);
	SERVER="rcssserver-"
	SERVER_VERSION="15.3.0"
	SERVER_FORMAT=".tar.gz"

	echo "--------------------------------------------------------------------------";
	echo "Configuring rcssserver";
	echo "--------------------------------------------------------------------------";
	echo "";
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
			if [ -e $SERVER$SERVER_VERSION$SERVER_FORMAT ]
				then

					echo "";
					echo "File [$SERVER$SERVER_VERSION$SERVER_FORMAT] found."
					sleep 1;
					echo "Configuring $SERVER$SERVER_VERSION.."
					echo "";
					sleep 1;

					sudo tar -xzf $SERVER$SERVER_VERSION$SERVER_FORMAT;
					cd $SERVER$SERVER_VERSION;
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					sudo ./configure
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;

				else

					echo "File [$SERVER$SERVER_VERSION$SERVER_FORMAT] not found"
					sleep 1;			
					echo "Starting [$SERVER$SERVER_VERSION$SERVER_FORMAT] download.."
					sleep 1;

					sudo wget -q --show-progress http://ufpr.dl.sourceforge.net/project/sserver/rcssserver/15.3.0/rcssserver-15.3.0.tar.gz
					
					sudo tar -xzf $SERVER$SERVER_VERSION$SERVER_FORMAT;
					cd $SERVER$SERVER_VERSION;
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					sudo ./configure
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;

					echo "";
					echo "$SERVER$SERVER_VERSION$SERVER_FORMAT was successfully installed!";
					echo "";
			fi
			else
					echo "$SERVER$SERVER_VERSION was successfully installed!";
	fi	
}

INSTALL_MONITOR(){

	INSTALLED=$(locate rcsc |egrep -v "home|rcss-tools" | wc -l);
	MONITOR="rcssmonitor-"
	MONITOR_VERSION="15.2.0"
	MONITOR_FORMAT=".tar.gz"

	echo "--------------------------------------------------------------------------";
	echo "Configuring rcsmonitor";
	echo "--------------------------------------------------------------------------";
	echo "";
	sleep 1;
	if [ "$INSTALLED" -eq 0 ]
		then
			if [ -e $MONITOR$MONITOR_VERSION$MONITOR_FORMAT ]
				then
					
					echo "";
					echo "File [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT] found."
					sleep 1;
					echo "Configuring $SERVER$SERVER_VERSION.."
					echo "";
					sleep 1;

					sudo tar -xzf $MONITOR$MONITOR_VERSION$MONITOR_FORMAT;
					cd $MONITOR$MONITOR_VERSION;
					make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					./configure
					sudo sed -i 's/-pthread-lQtGui/-pthread -lQtGui/' config.status* && echo "-pthread-lQtGui CORRIDO!"
			
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;

				else
					
					echo "File [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT] not found"
					sleep 1;			
					echo "Starting [$MONITOR$MONITOR_VERSION$MONITOR_FORMAT] download.."
					sleep 1;

					sudo wget -q --show-progress http://tenet.dl.sourceforge.net/project/sserver/rcssmonitor/15.2.0/rcssmonitor-15.2.0.tar.gz;

					sudo tar -xzf $MONITOR$MONITOR_VERSION$MONITOR_FORMAT;
					cd $MONITOR$MONITOR_VERSION;
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) clean;
					./configure
					sudo sed -i 's/-pthread-lQtGui/-pthread -lQtGui/' config.status* && echo "-pthread-lQtGui CORRIDO!"
	
					sudo make -j $(cat /proc/cpuinfo | grep processor | wc -l) install;
					cd ..;
			fi
		else
			echo "$MONITOR$MONITOR_VERSION already installed!"
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
