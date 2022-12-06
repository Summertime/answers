#!/usr/bin/env bash
shopt -s -o errexit nounset noclobber pipefail
BASH_COMPAT=5.2
shopt -s extglob globstar lastpipe patsub_replacement

declare -a S=( '' '' '' '' '' '' '' '' '' )

while read -r && [[ $REPLY =~ .(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.). ]]; do
	for N in {0..8}; do
		C="${BASH_REMATCH[N+1]}"
		if [[ $C = [[:alpha:]] ]]; then
			S[N]=$C${S[N]}
		fi
	done
done

while read -r && [[ $REPLY =~ 'move '([0-9]+)' from '([0-9]+)' to '([0-9]+) ]]; do
	declare -i M=BASH_REMATCH[1]
	declare -i F=BASH_REMATCH[2]-1
	declare -i T=BASH_REMATCH[3]-1
	S[T]=${S[T]}${S[F]: -M} # Add it
	S[F]=${S[F]::-M} # Remove it

done

for N in {0..8}; do
	printf '%s' "${S[N]: -1}"
done
printf '\n'
