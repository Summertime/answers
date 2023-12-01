#!/usr/bin/env bash
#!/usr/bin/env bash
declare -i total=0
while read -r; do
	[[ $REPLY =~ ([0-9]) ]]
	A=${BASH_REMATCH[1]}
	[[ $REPLY =~ .*([0-9]) ]]
	B=${BASH_REMATCH[1]}
	(( total += $A$B )) || :
done
echo $total
