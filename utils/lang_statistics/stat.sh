#!/bin/bash
names=( "alex SC" jachym kof )

function collect {
#create file
printf "" > $1

#header
printf "name," >> $1;
for n in "${names[@]}";
do
  printf "$n," >> "$1";
done
printf "\n" >> $1

#collect values by vocabulary
for i in `cat ./vocabulary.txt`;
do
  printf "$i " >> $1;
  for n in "${names[@]}";
  do
    printf "$(grep -roh --exclude-dir="HistoryLogs" $i "../../$n" | wc -w) " >> "$1";
  done
  printf "\n" >> "$1"
done
}

collect data.csv
