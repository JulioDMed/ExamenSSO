!/bin/bash

#!/bin/bash

version=$(grep 'VERSION_ID' /etc/os-release)
listado=$(yum list installed | grep '^clamav')
centos=$(cat /etc/centos-release)
echo "La version de Centos es: $centos"


if [[$lsitado = ""]];
then
        echo "No esta instalado Clamav"
        sudo yum -y install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
else
        echo "Esta instalado"
        echo "Desistalando"
        sudo yum -y erase clamav*
        echo "Instalandoo"
        slee 5
        sudo yum -y install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm

fi

if [[ $version = 'VERSION_ID="7"' ]];
then
         sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
fi

if  [[ $(yum check-update -q | awk '{print $1}') = "" ]];
then
        echo"Todos los paquetes estan instalados"
else
        for line in $(yum check-update -q | awk '{print $1}');
        do
                sudo yum -y update $line
        done
fi
