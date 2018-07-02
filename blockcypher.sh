#!/bin/bash
#!Coded by Suleman Malik
#!www.sulemanmalik.com
ln(){
	echo ''
	echo -e "\033[0;31m-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\033[0m"
	echo ''
}
bnk(){
	echo ''
}
figlet BlockCypher
echo -e "\033[0;32mby @SulemanMalik_3\033[0m                                    v1.0"
echo "----------------------------------------------------------"
bnk
echo "Transcation_code:"
read transaction
bnk
echo "----------------------------------------------------------"
bnk
echo -e "\033[0;33m--- Processing Request ---\033[0m"
bnk
req=$(curl https://live.blockcypher.com/btc/tx/$transaction/ >> temp_bc)
sleep 1
T1=$(cat temp_bc | grep -A1 "class=\"tagline wrapit semi\"" | sed -e 's/<[^>]*>//g' | sed '/^\s*$/d')
C1=$(cat temp_bc | grep -A1 "id=\"num-confs\"" | sed -e 's/<[^>]*>//g' | sed '/^\s*$/d')
B1=$(cat temp_bc | grep -A1 "class=\"hidden-xs\"" | sed -e 's/<[^>]*>//g' | sed '/^\s*$/d' | Head -n 1)
S1=$(cat temp_bc | grep -o '<td>.*</td>' | Head -n 1 | sed -e 's/<[^>]*>//g')
Re=$(cat temp_bc | grep -o '<td>.*</td>' | Tail -n 1 | sed -e 's/<[^>]*>//g')
T2=$(cat temp_bc | grep -A1 "class=\"dash-label\"" | sed -e 's/<[^>]*>//g' | head -n 2 | tail -n 1)
F1=$(cat temp_bc | grep -A1 "class=\"dash-label\"" | sed -e 's/<[^>]*>//g' | head -n 5 | tail -n 1)
Rc1=$(cat temp_bc | grep -A1 "class=\"timeago\"" | sed -e 's/<[^>]*>//g')
H1=$(cat temp_bc | grep '<a href="/btc/block/' | tail -n 2 | head -n 1 | sed -e 's/<[^>]*>//g' )
sleep 1
ln
echo "-- BTC Trans Detail ---"
bnk
sleep 1
echo -e "\033[0;33mTransaction_code:\033[0m \033[0;32m$T1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mConfirmation:\033[0m \033[0;32m$C1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mReceived:\033[0m \033[0;32m$Rc1 \033[0m"
bnk
sleep 1
echo -e  "\033[0;33mFees:\033[0m \033[0;32m$F1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mAMOUNT TRANSACTED:\033[0m \033[0;32m$T2\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mBlock Hash:\033[0m \033[0;32m$B1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mBlock Height:\033[0m \033[0;32m$H1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mBlock Size:\033[0m \033[0;32m$S1\033[0m"
bnk
sleep 1
echo -e  "\033[0;33mRelayed By:\033[0m \033[0;32m$Re\033[0m"
bnk
sleep 1
echo "For detail about 6+ confirmation read at https://www.buybitcoinworldwide.com/confirmations/"
ln
echo "Press return key to exit."
read ext
rm temp_bc