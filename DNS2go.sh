#/usr/bin/env bash
if [ -f /tmp/rev1 ]; then
	rm /tmp/rev1
fi

if [ -f /tmp/rev2 ]; then
	rm /tmp/rev2
fi

for i in $(ls); do
	awk '/ORIGIN/{n++}{print >"'"$i"'" n ".txt" }' $i
done
for i in $(ls *.txt); do
	ARPA=$(head $i -n1 | grep "arpa" | awk '{print $2}' | awk -F '.' '{print $3"."$2"."$1}');
	IFS=$'\n';
	while read line;
	do
		if [[ $line != ';' ]]; then
			if [[ $line != 'ORIGIN' ]]; then
				substr1=$(printf $line | grep -v "^;\|ORIGIN"|awk '{print $1}');
				substr2=$(printf $line | grep -v "^;\|ORIGIN"|awk '{print $4}');
				printf "$ARPA.$substr1 $substr2 \n">>/tmp/rev1;
			fi
		fi
	done <$i
done
cat /tmp/rev1 |  awk '{ print length, $0 }' | sort -n | cut -d" " -f2- >/tmp/rev2
cat /tmp/rev2 | grep -v "^\." | awk 'NF==2{print}{}' | sort -V >./reverse.csv
rm *.txt
