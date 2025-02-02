#!/bin/bash/gdthehacker

pkgs=(php tor pv curl)
for p in "${pkgs[@]}"; do 
  if ! hash ${p} > /dev/null 2>&1; then
    printf "\n\e[32m${p} not found installing....\n\e[0m"
    apt install ${p} -y > /dev/null 2>&1
  fi 
done
echo instaling Dark-Door...

curl -sLO https://github.com/GDTHEHACKER/Dark-Door/raw/main/torrc
curl -sLO https://github.com/GDTHEHACKER/Dark-Door/raw/main/GDH

mv torrc $PREFIX/etc/tor/torrc
mv GDH $PATH/Dark-Door

chmod +x $PATH/Dark-Door
if [[ -d $PREFIX/var/lib/tor/hidden_service/ ]];then 
  printf "\n 
now you can launch Dark-Door by typing \e[31m Dark-Door \e[0m from any directory
"
else
  echo tor hidden hidden_service directory not found creating...
  mkdir -p $PREFIX/var/lib/tor/hidden_service/ 
  touch -p $PREFIX/data/data/com.termux/files/usr/var/lib/tor/hidden_service/hostname
  printf "\nnow you can launch Dark-Door by typing \e[3131m Dark-Door \e[0m from any directory"
fi 


