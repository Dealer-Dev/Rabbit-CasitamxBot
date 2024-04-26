#!/bin/bash
[[ ! -e /usr/local/lib/url ]] && url='https://gitlab.com/donpatobot/dlbt/-/raw/main' || url=$(</usr/local/lib/url)

source <(curl -sSL ${url}/sbin/colores)

 log=( [0]='/var/ins' [1]='/root/.url' )
sdir=( [0]='/etc/adm-db' [1]='/etc/scripts' )
scpd=([0]="${sdir[1]}/scp1" [1]="${sdir[1]}/scp2" )
soft=('jq' 'bc' 'curl' 'netcat' 'ufw' 'netcat-traditional' 'net-tools' 'apache2' 'lolcat' 'figlet' 'npm')

scpconf="${sdir[1]}/scripts.conf"


	    (
echo ${sdir[@]} | xargs rm -rf
echo ${scpd[@]} | xargs rm -rf
echo ${sdir[@]} | xargs mkdir -p
echo ${scpd[@]} | xargs mkdir -p
	    ) &> /dev/null

if [[ ! -e ${log[1]} ]]; then
	while [[ -z $inst ]]; do
		apt update -y && apt upgrade -y && dpkg --configure -a
		clear&&msg -bar
		print_center -azu 'INSTALANDO PAQUETES'
		msg -bar
		for((i=0;i<${#soft[@]};i++));do
			pak="${soft[$i]}"&&length=$(( 20 - "${#pak}" ))
			(apt-get install $pak -y) &> /dev/null
			echo -ne "\033[1;97m  # apt-get install ${pak} ."
			for((x=0;x<$length;x++));do
				echo -ne "."&&sleep 0.05
			done
			[[ $(dpkg --get-selections|grep "$pak") ]] && status="\e[1;32mINSTALADO" || status="\e[1;31mNO INSTALADO"
			echo -ne " $status\n"
		done
		if apt-get install apache2 -y &> /dev/null; then
			sed -i 's;Listen 80;Listen 81;g' /etc/apache2/ports.conf
		elif apt install apache -y &> /dev/null; then
			sed -i 's;Listen 80;Listen 81;g' /etc/apache2/ports.conf
		elif apt install apache2-bin -y &> /dev/null; then
			sed -i 's;Listen 80;Listen 81;g' /etc/apache2/ports.conf
		fi
			service apache2 restart
		sudo ufw reload&&sudo ufw allow 81/tcp
		if dpkg --get-selections|grep 'ufw' &> /dev/null; then
			sudo ufw allow 81&&sudo ufw allow 8888
		else
			sudo apt install ufw&&sudo ufw allow 81
		fi
		msg -bar
		echo -e " \e[1;33mSI ALGÚN PAQUETE NO SE INSTALÓ\n $(msg -verm 'REINICIA LA INSTALACIÓN')"
		msg -bar
		echo -ne "\n$(msg -ne '¿reinstalar paquetes?:')"
		read -p $'\e[1;32m ' inst
		[[ $inst != @('s'|'Si'|'si'|'y'|'Y'|'Yes') ]] && break || unset inst
	done
	touch ${log[1]}
	if [[ ! -e ${scpconf} ]]; then
		echo ${sdir[@]} |xargs mkdir -p
		clear
		msg -bar
			(
		wget ${url}/otros/msg
		unzip msg -d ${scpd[0]}
		chmod +x ${scpd[0]}/*
		rm -f msg
		wget -O ${scpd[1]}/lista ${url}/otros/lista
		cd ${scpd[1]}&&wget -i lista
		chmod +x *
		rm -f lista
			) &> /dev/null 2>&1
		fscp1=$(ls ${scpd[0]}|xargs)&&fscp2=$(ls ${scpd[1]}|xargs)
		rm -f ${scpconf}
		cat >> ${scpconf} <<- eof
			${fscp1}
			${fscp2}
		eof
		chmod +x ${scpconf}&&n=1
		msg -bar
		print_center -azu 'LACASITAMX'&&n=1
		msg -bar
		for vpsmx in $(echo "$fscp1");do
			echo -e "	     \e[1;30m[\e[1;31mFILE: \e[1;33m$n\e[1;30m]<<====>>[\e[1;97m$vpsmx\e[1;30m]"&&sleep 0.03
			let n++
		done
		msg -bar
		print_center -azu 'RABBIT'&&n=1
		msg -bar
		for chukk in $(echo "$fscp2");do
			echo -e "	     \e[1;30m[\e[1;31mFILE: \e[1;33m$n\e[1;30m]<<====>>[\e[1;97m$Rabbit\e[1;30m]"&&sleep 0.03
			let n++
		done
		msg -bar
		echo -ne "		\e[1;30m>> enter para continuar << \n"
		read
	fi
	clear&&msg -bar
	while read -p $'\e[1;31mIngrese su id: ' id; do
		if [[ -z $id ]]; then
			unset id&&msg -verm 'ingresa un id'&&sleep 2
				tput cuu1&&tput dl1
		else
			break
		fi
	done
	msg -bar
	while read -p $'\e[1;31mIngrese su token: ' token; do
		if [[ -z $token ]]; then
			unset token&&msg -verm 'ingresa su token'&&sleep 2
				tput cuu1&&tput dl1
		else
			break
		fi
	done
	echo "$id|$token" > ${sdir[0]}/sdata.conf
			(
	wget -O ${sdir[0]}/BotGen.sh ${url}/BotGen.sh
	wget -O /usr/local/sbin/http-server.sh ${url}/sbin/http-server.py
	wget -O /usr/local/sbin/botgen ${url}/sbin/gerar
	chmod +x /usr/local/sbin/http-server.sh /usr/local/sbin/botgen ${sdir[0]}/BotGen.sh
	wget -O /etc/systemd/system/botgen.service ${url}/otros/service/botgen.service
	wget -O /etc/systemd/system/http-server.service ${url}/otros/service/http-server.service
			) &> /dev/null

		for service in `echo "botgen http-server"`; do
			if systemctl enable $service &> /dev/null; then
				msg -verd "[✓] módulo $service habilitado correctamente [✓]"
			fi
			if systemctl start $service &> /dev/null; then
				msg -verd "[✓] módulo $service activado correctamente [✓]"
			fi
		done
	clear
	msg -bar
	echo -e "	$(msg -verd '[✓] bot iniciado correctamente [✓]')"
	msg -bar
	exit
fi
