#!/usr/bin/env bash
shopt -s -o errexit nounset noclobber pipefail
BASH_COMPAT=5.2
shopt -s extglob globstar lastpipe patsub_replacement

declare -a W=( 1 2 0 )
declare -a L=( 2 0 1 )

tr ABCXYZ 012012 | while read E P; do
	printf '%s\n' $((
		(
			P==W[E] ? 6 :
			P==E    ? 3 :
			0
		) + P + 1
	))
done | awk '{X+=$0} END {print X}'
