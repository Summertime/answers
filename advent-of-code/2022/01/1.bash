#!/usr/bin/env bash
{ cat; printf '\n';} | awk '{X+=$0} /^$/ {print X;X=0}' | sort -n | tail -n 1
