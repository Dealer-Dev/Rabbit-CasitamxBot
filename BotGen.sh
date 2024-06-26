#!/bin/bash
# -*- ENCODING: UTF-8 -*-
meu_ip_fun() {
    MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MIP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
SCPT_DIR="/etc/scripts/scp1"
DIRR="/etc/scripts/scp2"
#
BASICINST=$(ls ${SCPT_DIR})
BASICINSTR=$(ls ${DIRR})

[[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
mkdir /etc/bot/creditos
DIR="/etc/http-shell"
LIST="lista-arq"
CIDdir=/etc/adm-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
SRC="${CIDdir}/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && echo >${CID}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
[[ ! -d /etc/adm-db/Creditos ]] && mkdir /etc/adm-db/Creditos
USRdatabase2="/etc/adm-db/Creditos"
[[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] || apt-get install jq -y &>/dev/null
[[ ! -e "/bin/ShellBot.sh" ]] && wget -O /bin/ShellBot.sh https://github.com/Dealer-Dev/Rabbit-CasitamxBot/main/otros/ShellBot.sh &>/dev/null
[[ -e /etc/texto-bot ]] && rm /etc/texto-bot
LINE="━━━━━━━━━━━━━━━━━━━━━━"
line=$LINE
# Importando API
source ShellBot.sh


[[ -e ${CIDdir}/sdata.conf ]] && {
	bot_token=$(cat ${CIDdir}/sdata.conf|awk -F "|" '{print $2}')
	permited=$(cat ${CIDdir}/sdata.conf|awk -F "|" '{print $1}')
} || {

	bot_token="$(cat ${CIDdir}/token)"
	permited=$(cat ${CIDdir}/Admin-ID)
}

# Inicializando el bot
ShellBot.init --token "$bot_token" --monitor --flush --return map
ShellBot.username

reply() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

    ShellBot.sendMessage --chat_id $var \
        --text "$comando" \
        --parse_mode html \
        --reply_markup "$(ShellBot.ForceReply)"
    [[ "${callback_query_data}" = /del || "${message_text}" = /del ]] && listID_src
    [[ "${callback_query_data}" = /rell || "${message_text}" = /rell ]] && catrell
}

# verificacion primarias
gerar-casita(){
    meu_ip_fun
    unset newresell
    newresell="${USRdatabase2}/Mensaje_$chatuser.txt"
    if [[ ! -e ${newresell} ]]; then
        echo "${message_from_first_name}" >${SCPT_DIR}/message.txt
    else
        echo "$(cat ${newresell})" >${SCPT_DIR}/message.txt
    fi

    [[ ! $newresell ]] && credill="By $(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || credill="By $(cat ${SCPT_DIR}/message.txt)"

    valuekey="$(date | md5sum | head -c10)"
    valuekey+="$(echo $(($RANDOM * 10)) | head -c 5)"
    fun_list "$valuekey"
    keyfinal=$(ofusb "$IP:8888/$valuekey/$LIST")

    bot_retorno="$line\n"
    bot_retorno+="🐰 Reseller: $credill\n"
    bot_retorno+="\n"
    bot_retorno+="💾 Instalador:\n"
    bot_retorno+="\n"
    bot_retorno+="<code> wget https://raw.githubusercontent.com/lacasitamx/INSTALADORMOD/master/LACASITA.sh; chmod 777 LACASITA.sh; ./LACASITA.sh</code>\n"
    bot_retorno+="\n"
    bot_retorno+="🔑 Key: (Valida por solo 30 min) \n"
    bot_retorno+="\n"
    bot_retorno+="<code>${keyfinal}</code>\n"
    bot_retorno+="\n"
    bot_retorno+=" 👀 KEY 𝑮𝑬𝑵𝑬𝑹𝑨𝑫𝑨:  [  $(ls /etc/http-shell/ | grep name | wc -l) ]\n"
    bot_retorno+="\n"
    bot_retorno+="📀Ubuntu: 18, 20.04 LTS ¡Recomendado\n"
    msj_fun
}

gerar-rabbit(){
LIST=$(echo 'Rabbit-'|rev)
    meu_ip_fun
    unset newresell
    newresell="${USRdatabase2}/Mensaje_$chatuser.txt"
    if [[ ! -e ${newresell} ]]; then
        echo "${message_from_first_name}" >${SCPT_DIR}/message.txt
    else
        echo "$(cat ${newresell})" >${SCPT_DIR}/message.txt
    fi

    [[ ! $newresell ]] && credill="By $(cat ${USRdatabase2}/Mensaje_$chatuser.txt)" || credill="By $(cat ${SCPT_DIR}/message.txt)"

    valuekey="$(date | md5sum | head -c10)"
    valuekey+="$(echo $(($RANDOM * 10)) | head -c 5)"
    fun_list2 "$valuekey"
    keyfinal=$(ofusa "$IP:8888/$valuekey/$LIST")
    bot_retorno="$line\n"
    bot_retorno+="👤 Reseller: $credill\n"
    bot_retorno+="\n"
    bot_retorno+="💾 Instalador:\n"
    bot_retorno+="\n"
    bot_retorno+="⚡ <code>apt update -y; apt upgrade -y; wget -q https://raw.githubusercontent.com/Dealer-Dev/SCRIPT-RABBIT-BO/main/setup; chmod 777 setup; ./setup --ADMcgh</code> ⚡\n"
    bot_retorno+="\n"
    bot_retorno+="🔑 Key: (Valida por solo 30 min) \n"
    bot_retorno+="\n"
    bot_retorno+="<code>${keyfinal}</code>\n"
    bot_retorno+="\n"
    bot_retorno+=" 👀 KEY 𝑮𝑬𝑵𝑬𝑹𝑨𝑫𝑨:  [  $(ls /etc/http-shell/ | grep name | wc -l) ]\n"
    bot_retorno+="\n"
    bot_retorno+="📀Ubuntu: 18, 20.04 LTS ¡Recomendado\n"
    msj_fun
}


fun_list() {
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    unset KEY
    KEY="$1"
    #CRIA DIR
    [[ ! -e ${DIR} ]] && mkdir ${DIR}
    #ENVIA ARQS
    i=0
    VALUE+="gerar.sh instgerador.sh http-server.py lista-arq $BASICINST"
    for arqx in $(ls ${SCPT_DIR}); do
        [[ $(echo $VALUE | grep -w "${arqx}") ]] && continue
        echo -e "[$i] -> ${arqx}"
        arq_list[$i]="${arqx}"
        let i++
    done
    #CRIA KEY
    [[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
    #PASSA ARQS
    nombrevalue="${chatuser}"
    #ADM BASIC
    arqslist="$BASICINST"
    for arqx in $(echo "${arqslist}"); do
        [[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
        cp ${SCPT_DIR}/$arqx ${DIR}/${KEY}/
        echo "$arqx" >>${DIR}/${KEY}/${LIST}
    done
    rm ${SCPT_DIR}/*.x.c &>/dev/null
    echo "$nombrevalue" >${DIR}/${KEY}.name
    [[ ! -z $IPFIX ]] && echo "$IPFIX" >${DIR}/${KEY}/keyfixa
    at now +2 hours <<<"rm -rf ${DIR}/${KEY} && rm -rf ${DIR}/${KEY}.name"
}
fun_list2(){
    rm ${DIRR}/*.x.c &>/dev/null
    unset KEY
    KEY="$1"
    #CRIA DIR
    [[ ! -e ${DIR} ]] && mkdir ${DIR}
    #ENVIA ARQS
    i=0
    VALUE+="gerar.sh instgerador.sh http-server.py lista-arq $BASICINSTRUFU"
    for arqx in $(ls ${DIRR}); do
        [[ $(echo $VALUE | grep -w "${arqx}") ]] && continue
        echo -e "[$i] -> ${arqx}"
        arq_list[$i]="${arqx}"
        let i++
    done
    #CRIA KEY
    [[ ! -e ${DIR}/${KEY} ]] && mkdir ${DIR}/${KEY}
    #PASSA ARQS
    nombrevalue="${chatuser}"
    #ADM BASIC

    arqslist="$BASICINSTR"
    for arqx in $(echo "${arqslist}"); do
        [[ -e ${DIR}/${KEY}/$arqx ]] && continue #ANULA ARQUIVO CASO EXISTA
        cp ${DIRR}/$arqx ${DIR}/${KEY}/
        echo "$arqx" >>${DIR}/${KEY}/${LISTRUFU}
    done
    rm ${DIRR}/*.x.c &>/dev/null
    echo "$nombrevalue" >${DIR}/${KEY}.name
    [[ ! -z $IPFIX ]] && echo "$IPFIX" >${DIR}/${KEY}/keyfixa
    at now +2 hours <<<"rm -rf ${DIR}/${KEY} && rm -rf ${DIR}/${KEY}.name"
}

ofusa() {
unset server
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="x";;
"x")txt[$i]=".";;
"5")txt[$i]="s";;
"s")txt[$i]="5";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="0";;
"0")txt[$i]="4";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
ofusb() {
unset server
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="C";;
"C")txt[$i]=".";;
"3")txt[$i]="@";;
"@")txt[$i]="3";;
"4")txt[$i]="9";;
"9")txt[$i]="4";;
"6")txt[$i]="P";;
"P")txt[$i]="6";;
"L")txt[$i]="K";;
"K")txt[$i]="L";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
menu_print() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

    if [[ $(echo $permited | grep "${chatuser}") = "" ]]; then
        # ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
        ShellBot.sendMessage --chat_id $var \
            --text "<i>$(echo -e $bot_retorno)</i>" \
            --parse_mode html \
            --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_user')"
    else
        # ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
        ShellBot.sendMessage --chat_id $var \
            --text "<i>$(echo -e $bot_retorno)</i>" \
            --parse_mode html \
            --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_conf')"
    fi
}

menu_printSN() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

    if [[ $(echo $permited | grep "${chatuser}") = "" ]]; then
        ShellBot.sendMessage --chat_id $var \
            --text "<i>$(echo -e $bot_retorno)</i>" \
            --parse_mode html \
            --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_send_id')"
    fi
}

download_file() {
    # shellbot.sh editado linea 3986
    user=User-ID
    [[ -e ${CID} ]] && rm ${CID}
    local file_id
    ShellBot.getFile --file_id ${message_document_file_id[$id]}
    ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${CIDdir}"
    local bot_retorno="ID user bot\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="Se restauro con exito!!\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="${return[file_path]}\n"
    bot_retorno+="$LINE"
    ShellBot.sendMessage --chat_id "${message_chat_id[$id]}" \
        --reply_to_message_id "${message_message_id[$id]}" \
        --text "<i>$(echo -e "$bot_retorno")</i>" \
        --parse_mode html
    return 0
}

msj_add() {
    ShellBot.sendMessage --chat_id ${1} \
        --text "<i>$(echo -e "$bot_retor")</i>" \
        --parse_mode html
}

upfile_fun() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
    ShellBot.sendDocument --chat_id $var \
        --document @${1}
}

invalido_fun() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
    local bot_retorno="\n"
    bot_retorno+="\n"
    # bot_retorno+="Quizas debes usar este /keygen\n"
    # bot_retorno+="O Posiblemente no estas Autorizado, clic\n"
    # bot_retorno+="prices o Contacta a @DealerServices235\n"
    # bot_retorno+="y adquiere una subscripcion\n"
    # bot_retorno+="••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\n"
    ShellBot.sendMessage --chat_id $var \
        --text "<i>$(echo -e $bot_retorno)</i>" \
        --parse_mode html
    return 0
}

msj_fun() {
    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
    ShellBot.sendMessage --chat_id $var \
        --text "<i>$(echo -e "$bot_retorno")</i>" \
        --parse_mode html
    return 0
}
upfile_src() {
    cp ${CID} $HOME/
    upfile_fun $HOME/User-ID
    rm $HOME/User-ID
}

start_gen() {
    unset PIDGEN
    PIDGEN=$(ps aux | grep -v grep | grep "http-server.sh")
    if [[ ! $PIDGEN ]]; then
        screen -dmS generador /bin/http-server.sh -start
        local bot_retorno="$LINE\n"
        bot_retorno+="Generador: <u>EN LINEA</u> ✅\n"
        bot_retorno+="$LINE\n"
        msj_fun
    else
        killall http-server.sh
        local bot_retorno="$LINE\n"
        bot_retorno+="Generador: <u>APAGADA</u> ❌\n"
        bot_retorno+="$LINE\n"
        msj_fun
    fi
}

infosys_src() {

    #HORA Y FECHA
    unset _hora
    unset _fecha
    _hora=$(printf '%(%H:%M:%S)T')
    _fecha=$(printf '%(%D)T')

    #PROCESSADOR
    unset _core
    unset _usop
    _core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
    _usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")

    #MEMORIA RAM
    unset ram1
    unset ram2
    unset ram3
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    ram2=$(free -h | grep -i mem | awk {'print $4'})
    ram3=$(free -h | grep -i mem | awk {'print $3'})

    unset _ram
    unset _usor
    _ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
    _usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")

    unset os_sys
    os_sys=$(echo $(cat -n /etc/issue | grep 1 | cut -d' ' -f6,7,8 | sed 's/1//' | sed 's/      //')) && echo $system | awk '{print $1, $2}'
    meu_ip=$(wget -qO- ifconfig.me)
    bot_retorno="$LINE\n"
    bot_retorno+="S.O: $os_sys\n"
    bot_retorno+="Su IP es: $(meu_ip)\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="Ram: $ram1 || En Uso: $_usor\n"
    bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="CPU: $_core || En Uso: $_usop\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="FECHA: $_fecha\n"
    bot_retorno+="HORA: $_hora\n"
    bot_retorno+="$LINE\n"
    msj_fun
}

cache_src() {

    #MEMORIA RAM
    unset ram1
    unset ram2
    unset ram3
    unset _usor
    _usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    ram2=$(free -h | grep -i mem | awk {'print $4'})
    ram3=$(free -h | grep -i mem | awk {'print $3'})
    bot_retorno="==========Antes==========\n"
    bot_retorno+="Ram: $ram1 || EN Uso: $_usor\n"
    bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
    bot_retorno+="=========================\n"
    msj_fun

    sleep 2

    sudo sync
    sudo sysctl -w vm.drop_caches=3 >/dev/null 2>&1

    unset ram1
    unset ram2
    unset ram3
    unset _usor
    _usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
    ram1=$(free -h | grep -i mem | awk {'print $2'})
    ram2=$(free -h | grep -i mem | awk {'print $4'})
    ram3=$(free -h | grep -i mem | awk {'print $3'})
    bot_retorno="==========Ahora==========\n"
    bot_retorno+="Ram: $ram1 || EN Uso: $_usor\n"
    bot_retorno+="USADA: $ram3 || LIBRE: $ram2\n"
    bot_retorno+="=========================\n"
    msj_fun
}

myid_src() {
    bot_retorno="━━━━━━━━━━━━━━━\n"
    bot_retorno+="ID:<code>${chatuser}</code>\n"
    bot_retorno+="━━━━━━━━━━━━━━━\n"
    msj_fun
}

deleteID_reply() {
    delid=$(sed -n ${message_text[$id]}p ${CID})
    sed -i "${message_text[$id]}d" ${CID}
    bot_retorno="$LINE\n"
    bot_retorno+="ID eliminado con exito!\n"
    bot_retorno+="ID: ${delid}\n"
    bot_retorno+="$LINE\n"
    msj_fun
    #upfile_src
}

rell_reply() {
    [[ $(cat ${USRdatabase2} | grep "${message_text[$id]}") = "" ]] && {
        echo "${message_text[$id]}" >${USRdatabase2}/Mensaje_$chatuser.txt
        bot_retorno="$LINE\n"
        bot_retorno+="✅Creditos Cambiado ✅\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="Nuevo Reseller: ${message_text[$id]}\nPARA REGRESAR /menu\n"
        bot_retorno+="$LINE"

        [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
        ShellBot.sendMessage --chat_id $var \
            --text "<i>$(echo -e "$bot_retorno")</i>" \
            --parse_mode html

        return 0

    } || {
        bot_retorno="====ERROR====\n"
        bot_retorno+="$LINE\n"
        msj_fun
    }
}

addID_reply_tiempo() {
    [[ $(cat ${CID} | grep "${message_text[$id]}") = "" ]] && {
        echo "/${message_text[$id]}" >>${CID}
        bot_retorno="$LINE\n"
        bot_retorno+="✅ *ID agregado * ✅\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="$(<${CID})\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="New ID: ${message_text[$id]}\n"
        bot_retorno+="$LINE"

        bot_retor="🔰 Bot generador de key 🔰\n"
        bot_retor+="El Administrador te autorizó\n"
        bot_retor+="para usar el comando /keygen\n"
        bot_retor+="digita el comando /menu\n"
        bot_retor+="para actualizar el menu de comandos\n"
        bot_retor+="$LINE\n"
        msj_fun
        msj_add ${message_text[$id]}
        upfile_src
    } || {
        bot_retorno="====ERROR====\n"
        bot_retorno+="Este ID ya existe\n"
        bot_retorno+="$LINE\n"
        msj_fun
    }
}

addID_reply() {
    ids=$(echo ${message_text[$id]} | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig')
    idc=$(echo ${message_text[$id]} | awk '{print $3}' | sed -e 's/[^a-z0-9 -]//ig')
    valid=$(date '+%C%y-%m-%d' -d " +$idc days")
    [[ $(cat ${CID} | grep "$ids") = "" ]] && {
        [[ -e /root/RegBOT/banID ]] && sed -i "/${ids}/d" /root/RegBOT/banID
        echo "/${ids} | $valid" >>${CID}
        echo "/${ids} | $(date '+%C%y-%m-%d') | $(date +%R)" >>${CID}.reg
        bot_retorno="  ✉️ REGISTRO ACEPTADO  ✉️ \n"
        bot_retorno+=" 🆔 : ${ids} | ACEPTADO 🧾\n"
        bot_retorno+="$LINE\n"
        bot_retorno+=" FECHA DE REGISTRO : $(date '+%C%y-%m-%d')|$(date +%R) \n VALIDO HASTA : ${valid}|$(date +%R)\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="  ✅ ID REGISTRADO EXITOSAMENTE ✅\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="       Power by @DealerServices235\n"
        unset i
        for i in $(cat /etc/adm-db/User-ID | awk '{print $3}'); do
            [[ "$(date -d $(date '+%C%y-%m-%d') +%s)" -ge "$(date -d $i +%s)" ]] && {
                for id in $(cat /etc/adm-db/User-ID | grep "$i" | awk '{print $1}' | sed -e 's/[^a-z0-9 -]//ig'); do
                    sed -i "/${id}/d" /etc/adm-db/User-ID
                    bot_retor="  🐇 BIENVENIDO AL BOTGEN RABBIT - BO 🐇\n"
                    bot_retor+=" SU MEMBRESIA HA FINALIZADO POR CHECK ID\n"
                    bot_retor+=" FIN DE CONTRADO : $(date '+%C%y-%m-%d') - $(date +%R) \n"
                    bot_retor+=" SI DESEAS APELAR TU CONTRADO, CONTACTA CON $(cat </etc/adm-db/resell)\n"
                    bot_retor+=" $LINE\n"
                    bot_retor+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /prices \n"
                    bot_retor+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
                    bot_retor+=" $LINE\n"
                    msj_add ${id}
                done
            }
        done
        [[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
        [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
        [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
        bot_retor=" $LINE\n"
        bot_retor+=" EL ADM $(cat </etc/adm-db/resell) APROBO TU SOLICITUD\n"
        # bot_retor+=" \n"
        bot_retor+=" FECHA DE REGISTRO : $(date '+%C%y-%m-%d')|$(date +%R) \n VALIDO HASTA : ${valid}|$(date +%R)\n"
        bot_retor+=" 🆔 : ${ids} | 🔐 ACEPTADO 🧾\n"
        bot_retor+="𝙃SU RESELLER : ${firsnme} ${lastnm} \n"
        bot_retor+=" $LINE\n"
        bot_retor+=" GENERAR Key's usar el comando /keygen\n"
        bot_retor+=" Para MENU Digita el comando /menu\n"
        bot_retor+=" $LINE\n"
        # bot_retor+=" CONTACTA ESCRIBE AL ADM $(cat < /etc/adm-db/resell)\n "
        bot_retor+=" ADQUIERE TU MEMBRESIA DESDE @$(ShellBot.username) , DIGITANDO /menu \n"
        bot_retor+=" RECUERDA MANTENER TU CAPTURA DE PAGO, PARA ALGUN RECLAMO!\n"
        bot_retor+=" $LINE\n"
        msj_fun
        msj_add ${ids}
        upfile_src
    } || {
        bot_retorno=" ✉️ ====NOTIFICACION==== ✉️ \n"
        bot_retorno+="$LINE\n"
        bot_retorno+="Este ID ya esta Registrado\n"
        bot_retorno+="  ❌ ID NO REGISTRADO ❌\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="       Powe by @DealerServices235\n"
        bot_retorno+="$LINE\n"
        msj_fun
    }
}

catrell() {
    local bot_retorno="$LINE\n"
    bot_retorno+="INGRESE TUS CREDITOS\n"
    bot_retorno+="$LINE\n"
    msj_fun
}

listID_src() {
    lsid=$(cat -n ${CID})
    local bot_retorno="$LINE\n"
    bot_retorno+="LISTA DE ID CON ACCESO AL BOT\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="${lsid}\n"
    bot_retorno+="$LINE\n"
    msj_fun
}

ayuda_id() {
    bot_retorno="🐰 Bot generador de keys 🐰\n"
    bot_retorno+=" by @DealerServices235 \n"
    bot_retorno+="SU ID ES:<code>${chatuser}</code>\n\n"
    bot_retorno+="Para poder usar el bot deves enviarle tu ID al administrador Del Bot\n PARA QUE TENGAS ACCESO AL BOT\n"
    bot_retorno+="✅ ID enviado al admin ✅\n"
    msj_fun
}

menu_src() {
    bot_retorno="━━━━◢ 𝗠𝗘𝗡𝗨 𝗜𝗡𝗜𝗖𝗜𝗢 ◣━━━━\n"
    if [[ $(echo $permited | grep "${chatuser}") = "" ]]; then
        if [[ $(cat ${CID} | grep "${chatuser}") = "" ]]; then
            bot_retorno+="\n"
            bot_retorno+="🔴 ●⸺ 𝗦𝗜𝗡 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣\n"
            bot_retorno+="\n"
            bot_retorno+="👤 ●⸺ [ ${message_from_first_name[$id]} ]\n"
            bot_retorno+="🆔 ●⸺ [<code>${chatuser}</code> ]\n"
            bot_retorno+="️\n"
            bot_retorno+="🗓️TOTAL DIAS DE ACCESO🗓️\n"
            bot_retorno+="[ ❌ 𝗦𝗶𝗻 𝗮𝗰𝗰𝗲𝘀𝗼 𝗩𝗜𝗣 ❌ \n"
            bot_retorno+="📅VIGENCIA DEL ACCESO📅\n"
            bot_retorno+="[ ❌ 𝗦𝗶𝗻 𝗮𝗰𝗰𝗲𝘀𝗼 𝗩𝗜𝗣 ❌ ]\n"
            bot_retorno+="\n"
            bot_retorno+="️HORARIO: $(printf '%(%D⏰%H:%M:%S)T')\n"
            bot_retorno+="Hola : ${message_from_first_name[$id]}\n"
            bot_retorno+="Todavia no cuentas con una membresia activa\n"
            bot_retorno+="🔘 Recuerda No hacer 𝗦𝗣𝗔𝗠\n"
            menu_printSN
            #msj_fun
        else
            #creditos agregados
            unset creditos
            creditos="$(cat /etc/adm-db/Creditos/Mensaje_$chatuser.txt)"
            [[ ! $creditos ]] && credi="OFF" || credi="$creditos"
            #menú
            data_user=$(cat ${CID} | grep "${chatuser}" | awk -F "|" '{print $2}')
            data_sec=$(date +%s)
            data_user_sec=$(date +%s --date="$data_user")
            variavel_soma=$(($data_user_sec - $data_sec))
            dias_use=$(($variavel_soma / 86400))
            [[ "$dias_use" -le 0 ]] && dias_use=0 || dias_use=$(($dias_use + 1))
            #XD
            bot_retorno+="\n"
            bot_retorno+="🟢 ●⸺ 𝗖𝗢𝗡 𝗔𝗖𝗖𝗘𝗦𝗢 𝗩𝗜𝗣 \n"
            bot_retorno+="👤 ●⸺ [ ${message_from_first_name[$id]}  ] \n"
            bot_retorno+="🆔️ ●⸺ [ <code>${chatuser}</code> ] \n"
            bot_retorno+="\n"
            bot_retorno+="🗓 TOTAL DIAS DE ACCESO \n"
            bot_retorno+="👉 Te quedan [$dias_use] DIAS  \n"
            bot_retorno+="📅 FECHA DE TU ACCESO \n"
            bot_retorno+="👉 Expira el [ $data_user | $(date +%R) ]\n"
            bot_retorno+="\n"
            bot_retorno+="HORARIO : $(printf '%(%D⏰%H:%M:%S)T')\n"
            bot_retorno+="Hola : ${message_from_first_name[$id]} \n"
            bot_retorno+="Su ID se encuentra activado\n"
            bot_retorno+="📡 ●⸺ BOT Status [ (EN LINEA) ✅ ]\n"
            bot_retorno+="👤 USUARIO: @${message_from_username[$id]}\\n"
            bot_retorno+="️🥀RESELLER PERSONAL: $credi\n"
            bot_retorno+="🔑TOTAL DE KEYS GENERADAS [ $(ls /etc/http-shell/ | grep name | wc -l) ]\n"
            bot_retorno+="📍 Version V.1.0\n"
            menu_print
        fi

    else
        unset PID_GEN
        PID_GEN=$(ps x | grep -v grep | grep "http-server.sh")
        [[ ! $PID_GEN ]] && PID_GEN='(APAGADA) ❌' || PID_GEN='(EN LINEA) ✅'
        unset creditos
        creditos="$(cat /etc/adm-db/Creditos/Mensaje_$chatuser.txt)"
        [[ ! $creditos ]] && credi="OFF" || credi="$creditos"
        unset usadas
        usadas="$(cat /etc/http-instas)"
        [[ ! $usadas ]] && k_used="0" || k_used="$usadas"
        bot_retorno+="🔰 BIENVENIDO AL BOT 🔰\n"
        bot_retorno+="▫️Panel de control | VPSMX 8.9▫️\n"
        bot_retorno+="Gen $PID_GEN | Keys Used [$k_used]\n"
        bot_retorno+="KEY 𝑮𝑬𝑵𝑬𝑹𝑨𝑫𝑨:  [  $(ls /etc/http-shell/ | grep name | wc -l) ]\n"
        bot_retorno+="	RESELLER: $credi\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="ADM: @${message_from_username[$id]}\n"
        bot_retorno+="$LINE\n"
        menu_print
    fi
}
mensajecre() {
    error_fun() {
        local bot_retorno="$LINE\n"
        bot_retorno+="USAR EL COMANDO DE ESTA MANERA\n"
        bot_retorno+="$LINE\n"
        bot_retorno+="Ejemplo: /resell  @Dealer\n"
        bot_retorno+="$LINE\n"
        ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
            --text "<i>$(echo -e "$bot_retorno")</i>" \
            --parse_mode html
        return 0
    }

    [[ -z $1 ]] && error_fun && return 0

    echo "$1" >${USRdatabase2}/Mensaje_$chatuser.txt
    bot_retorno="$LINE\n"
    bot_retorno+="✅Creditos Cambiado ✅\n"
    bot_retorno+="$LINE\n"
    bot_retorno+="Nuevo Reseller: $1\nPARA REGRESAR /menu\n"
    bot_retorno+="$LINE"

    [[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
    ShellBot.sendMessage --chat_id $var \
        --text "<i>$(echo -e "$bot_retorno")</i>" \
        --parse_mode html

    return 0
}

[[ -d /root/RegBOT ]] || mkdir /root/RegBOT
send_ID() {
    MSG_id=$((${message_message_id} + 1))
    [[ -z ${callback_query_from_first_name} ]] && firsnme="${message_from_first_name}" || firsnme="${callback_query_from_first_name}"
    [[ -z ${callback_query_from_last_name} ]] && lastnme="${message_from_last_name}" || lastnme="${callback_query_from_last_name}"
    [[ -z ${callback_query_from_username} ]] && nUSER=${message_from_username} || nUSER=${callback_query_from_username}
    [[ -e /root/RegBOT/U_check.txt ]] && n_soli=$(cat /root/RegBOT/U_check.txt | grep ${chatuser} | wc -l) || n_soli=1
    [[ $n_soli < 2 ]] && {
        echo "${chatuser}" >>/root/RegBOT/U_check.txt
        bot_retor="$LINE\n"
        bot_retor+=" Cliente 『 ${firsnme} ${lastnme} 』\n"
        [[ -z ${nUSER} ]] && bot_retor+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retor+=" <u> ALIAS</u>: @${nUSER} CON $n_soli INTENTOS\n"
        bot_retor+="$LINE\n"
        bot_retor+=" FORMATO $MSG_id <tg-spoiler>${chatuser}</tg-spoiler> | <u>DIAS</u> \n"
        bot_retor+=" PARA ACEPTAR DA CLICK AQUI 👉 /add , LUEGO\n"
        bot_retor+=" PARA 4 DIAS COPY 👉 <code>${chatuser} | 4</code> \n"
        bot_retor+=" PARA 7 DIAS COPY 👉 <code>${chatuser} | 7</code> \n"
        bot_retor+=" PARA 15 DIAS COPY 👉 <code>${chatuser} | 15</code> \n"
        bot_retor+=" PARA 30 DIAS COPY 👉 <code>${chatuser} | 30</code> \n"
        bot_retor+=" PARA 60 DIAS COPY 👉 <code>${chatuser} | 60</code> \n"
        bot_retor+=" PARA 90 DIAS COPY 👉 <code>${chatuser} | 90</code> \n"
        bot_retor+=" PARA 180 DIAS COPY 👉 <code>${chatuser} | 179</code> \n"
        bot_retor+=" PARA 1 AÑO COPY 👉 <code>${chatuser} | 364</code> \n"
        bot_retor+=" CUSTOM COPY 👉 ♨️ <code>${chatuser} | dias</code> ♨️\n"
        bot_retor+="$LINE\n"
        bot_retor+=" VERIFIQUE SU TOKEN DE PAGO ANTES DE LA AUTORIZACION\n"
        bot_retor+="$LINE\n"
        msj_add "$(cat <${CIDdir}/Admin-ID)"
        bot_retorno="$LINE\n"
        bot_retorno+=" 🔰 𝚂𝚞 𝙸𝙳 【 <code>${chatuser}</code> 】 🔰\n"
        bot_retorno+="$LINE\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ AÑADA UN ALIAS PARA PODER SOLICITAR ⚠️\n" || bot_retorno+="UD SOLICITO AUTORIZACION A $(cat </etc/adm-db/resell)\n"
        [[ -z ${nUSER} ]] && bot_retorno+="   IMPOSIBLE VERIFICAR ID SIN ALIAS\n  REMARCA SU ${n_soli} SOLITUD INVALIDA \n" || bot_retorno+=" ESTA ES SU ${n_soli} SOLICITUD MEDIANTE ID DE REGISTRO\n"
        bot_retorno+="$LINE\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠ ID ENVIADO CON ADVERTENCIA (POSIBLE BANEO DE ID) ⚠️\n" || bot_retorno+="      ✅ ID ENVIADO EXITOSAMENTE ✅\n"
        bot_retorno+="$LINE\n"
        bot_retorno+=" ENVIE SU COMPROBANDO O CORREO DE PAGO PARA SU AUTORIZACION\n"
        bot_retorno+="$LINE\n"
        msj_fun
    } || {
        bot_retorno="$LINE\n"
        bot_retorno+=" 🔰 𝚂𝚞 𝙸𝙳 【 <code>${chatuser}</code> 】 🔰\n"
        bot_retorno+="$LINE\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ USUARIO SIN ALIAS ⚠️\n" || bot_retorno+=" <u> ALIAS</u>: @${nUSER} CON ID : <code>${chatuser}</code>\n"
        [[ -z ${nUSER} ]] && bot_retorno+=" ⚠️ AÑADA UN ALIAS PARA PODER SOLICITAR ⚠️\n" || bot_retorno+=" UD ENVIO ${n_soli} SOLICITUDES A $(cat </etc/adm-db/resell)\n"
        [[ -z ${nUSER} ]] && bot_retorno+="   IMPOSIBLE VERIFICAR ID SIN ALIAS\n  REMARCA SU ${n_soli} SOLITUD INVALIDA \n" || bot_retorno+=" SU PETICION FUE RECHAZADA POR EXCESO DE PETICIONES\n"
        bot_retorno+="     🚫🚫️ SU ID FUE BANEADO 🚫🚫 \n"
        bot_retorno+="$LINE\n"
        echo "${chatuser}" >>/root/RegBOT/banID
        bot_retorno+="        🐇 Power by: @DealerServices235 🐇\n"
        bot_retorno+="$LINE\n"
        msj_fun
    }
}

botao_send_id=''
botao_conf=''
botao_user=''

ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "🔐ACCESO" --callback_data '/admin'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "🥀AYUDA" --callback_data '/ayuda'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "🆔️ID" --callback_data '/id'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 2 --text "🐈ADMI" --callback_data '1' --url 't.me/kurumi_latin'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 2 --text "⚠️Menu⚠️" --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '👤 AGREGAR ID' --callback_data '/add'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '🚮 ELIMINAR' --callback_data '/del'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '👥 LISTA USER' --callback_data '/list'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text '🆔 ID' --callback_data '/ID'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '❌ POWER ✅' --callback_data '/power'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '🛠️ MENU' --callback_data '/menu'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '♻️AGREGAR RESELLER♻️' --callback_data '/rell'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 KEYGEN' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 KEYGEN' --callback_data '/keygen'

ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '♻️AGREGAR RESELLER♻️' --callback_data '/rell'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '🌴ADMI🌴' --callback_data '1' --url 't.me/kurumi_latin'

#
# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do

        chatuser="$(echo ${message_chat_id[$id]} | cut -d'-' -f2)"
        [[ -z $chatuser ]] && chatuser="$(echo ${callback_query_from_id[$id]} | cut -d'-' -f2)"
        echo $chatuser >&2
        #echo "user id $chatuser"

        comando=(${message_text[$id]})
        [[ -z $comando ]] && comando=(${callback_query_data[$id]})
        #echo "comando $comando"

	permited=$(cat ${CIDdir}/sdata.conf|awk -F "|" '{print $1}')

        if [[ $(echo $permited | grep "${chatuser}") = "" ]]; then
            if [[ $(cat ${CID} | grep "${chatuser}") = "" ]]; then
                case ${comando[0]} in
                /[Ii]d | /[Ii]D) myid_src & ;;
                /[Aa]cceso | [Aa]cceso) autori & ;;
                /[Aa]dmin | [Aa]dmin) send_ID & ;;
                /[Mm]enu | [Mm]enu | /[Ss]tart | [Ss]tart | [Cc]omensar | /[Cc]omensar) menu_src & ;;
                /[Aa]yuda | [Aa]yuda | [Hh]elp | /[Hh]elp) ayuda_id & ;;
                /* | *) invalido_fun & ;;
                esac
            else
                if [[ ${message_reply_to_message_message_id[$id]} ]]; then
                    case ${message_reply_to_message_text[$id]} in
                    '/rell') rell_reply ;;
                    *) invalido_fun ;;
                    esac

                elif [[ ${message_text[$id]} || ${callback_query_data[$id]} ]]; then
                    case ${comando[0]} in
                    /[Mm]enu | [Mm]enu | /[Ss]tart | [Ss]tart | [Cc]omensar | /[Cc]omensar) menu_src & ;;
                        #
                    /[Ii]d | /[Ii]D) myid_src & ;;
                    /[Ii]nstalador) link_src & ;;
                    /[Rr]esell | /[Rr]eseller) mensajecre "${comando[1]}" & ;;
                    /[Rr]ell) reply & ;;
                    /[Kk]eygen | /[Gg]erar | [Gg]erar | [Kk]eygen) gerar-casita & ;;
                    /[Rr]abbit | /[Rr]abbit | [Rr]abbit | [Rr]abbit) gerar-rabbit & ;;

                        # /[Cc]ambiar)creditos &;;
                    /* | *) invalido_fun & ;;
                    esac
                fi

            fi
        else

            if [[ ${message_reply_to_message_message_id[$id]} ]]; then
                case ${message_reply_to_message_text[$id]} in
                '/del') deleteID_reply ;;
                '/add') addID_reply ;;
                '/rell') rell_reply ;;
                #'/add2') addID_reply_tiempo ;;
                *) invalido_fun ;;
                esac

            elif [[ ${message_document_file_id[$id]} ]]; then
                download_file

            elif [[ ${message_text[$id]} || ${callback_query_data[$id]} ]]; then

                case ${comando[0]} in
                /[Mm]enu | [Mm]enu | /[Ss]tart | [Ss]tart | [Cc]omensar | /[Cc]omensar) menu_src & ;;
                /[Aa]yuda | [Aa]yuda | [Hh]elp | /[Hh]elp) ayuda_src & ;;
                /[Ii]d | /[Ii]D) myid_src & ;;
                /[Aa]dd | /[Aa]dd2 | /[Dd]el | /[Rr]ell) reply & ;;
                /[Pp]ower) start_gen & ;;
                /[Rr]esell | /[Rr]eseller) mensajecre "${comando[1]}" & ;;
                    /[Kk]eygen | /[Gg]erar | [Gg]erar | [Kk]eygen) gerar-casita & ;;
                    /[Rr]abbit | /[Rr]abbit | [Rr]abbit | [Rr]abbit) gerar-rabbit & ;;
                /[Ii]nfosys) infosys_src & ;;
                /[Ll]ist) listID_src & ;;
                /[Ii]nstalador) link_src & ;;
                /[Cc]ache) cache_src & ;;
                /* | *) invalido_fun & ;;
                esac

            fi

        fi
    done
done
