#!/usr/bin/env bash
shopt -s -o errexit nounset noclobber pipefail
BASH_COMPAT=5.2
shopt -s extglob globstar lastpipe patsub_replacement

declare -a W=( 1 2 0 )
declare -a L=( 2 0 1 )

tr ABCXYZ 012036 | while read E R; do
	printf '%s\n' $((
		(
			R==6 ? W[E] :
			R==0 ? L[E] :
			E
		) + R + 1
	))
done | awk '{X+=$0} END {print X}'
