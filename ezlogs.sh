#!/bin/bash

apps logs |
jq --unbuffered -r -M '[.level, .app, .message] | @tsv' |
awk -v BLUE="\033[1;34m" -v YELLOW="\033[1;33m" -v RED="\033[0;31m" -v GREY="\033[1;30m" -v NOCOL="\033[0m" '
  BEGIN { FS="\t"; }
  {
    switch ($1) {
      case "notice":
      case "info":
        printf BLUE;
        break
      case "warning":
        printf YELLOW;
        break
      case "alert":
      case "error":
      case "critical":
        printf RED;
        break
      default:
        printf NOCOL;
    }
    { printf "%-10s\t", sprintf("[%s]", toupper($1)); }
    { printf NOCOL; }
    { printf GREY; }
    { printf "%-25s\t", $2; }
    { printf NOCOL; }
    { $1 = ""; $2 = ""; }
    { {gsub(/^[ \t]+|[ \t]+$/, "", $0)}1; printf "%s\n", $0; system(""); }
  }'
