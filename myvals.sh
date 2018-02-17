#!/bin/bash
 
btc=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)
xmr=$(curl -s https://api.coinmarketcap.com/v1/ticker/monero/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)
xzc=$(curl -s https://api.coinmarketcap.com/v1/ticker/zcoin/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)
#ltc=$(curl -s https://api.coinmarketcap.com/v1/ticker/litecoin/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)
dgb=$(curl -s https://api.coinmarketcap.com/v1/ticker/digibyte/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)
etn=$(curl -s https://api.coinmarketcap.com/v1/ticker/electroneum/ | grep "price_usd" | cut -d ":" -f2 | cut -d '"' -f2)

intetn=${etn%.f}
intxmr=${xmr%.f}
intbtc=${btc%.f}
intxzc=${xzc%.f}
#intltc=${ltc%.f}
intdgb=${dgb%.f}

myetn="25"
myxmr="0.057734652840"
myxzc="0.41509929"
mybtc="0.02665796"
#myltc="0"
mydgb="2.16095847"

intmyetn=${myetn%.f}
intmyxmr=${myxmr%.f}
intmybtc=${mybtc%.f}
intmyxzc=${myxzc%.f}
intmyltc=${myltc%.f}
intmydgb=${mydgb%.f}

t=$(echo "$intxmr*$intmyxmr" | bc)
u=$(echo "$intbtc*$intmybtc" | bc)
v=$(echo "$intxzc*$intmyxzc" | bc)
w=$(echo "$intltc*$intmyltc" | bc)
x=$(echo "$intdgb*$intmydgb" | bc)
y=$(echo "$intetn*$intmyetn" | bc)

echo ' '
echo "$(tput smul)CURRENT BALANCES:$(tput rmul)"
echo "$(tput setaf 2)ETN:$(tput sgr0)$y"
echo "$(tput setaf 3)BTC:$(tput sgr0)$u"
#echo "$(tput setaf 5)LTC:$(tput sgr0)$w"
echo "$(tput setaf 1)XMR:$(tput sgr0)$t"
echo "$(tput setaf 10)XZC:$(tput sgr0)$v"
echo "$(tput setaf 6)DGB:$(tput sgr0)$x"
echo ' '

