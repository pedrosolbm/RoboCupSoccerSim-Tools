sudo updatedb			
sudo rm -vrf $(locate rcss |egrep -v "home")
sudo rm -vrf $(locate rcsc |egrep -v "home")
sudo updatedb
sudo rm -vrf $(locate rcss |egrep -v "home")
sudo rm -vrf $(locate rcsc |egrep -v "home")
