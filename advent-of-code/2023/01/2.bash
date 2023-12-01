#!/usr/bin/env bash

d () {
	case $1 in
		one  ) echo 1;;
		two  ) echo 2;;
		three) echo 3;;
		four ) echo 4;;
		five ) echo 5;;
		six  ) echo 6;;
		seven) echo 7;;
		eight) echo 8;;
		nine ) echo 9;;
		*    ) echo $1;;
	esac
}


declare -i total=0
while read -r; do
	[[ $REPLY =~ ([0-9]|one|two|three|four|five|six|seven|eight|nine) ]]
	A=$(d "${BASH_REMATCH[1]}")
	[[ $REPLY =~ .*([0-9]|one|two|three|four|five|six|seven|eight|nine) ]]
	B=$(d "${BASH_REMATCH[1]}")
	(( total += $A$B )) || :
done
echo $total
