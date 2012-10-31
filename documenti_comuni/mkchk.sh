#!/bin/bash

######################################################################
# Script per generare file di checklist per ogni file in una cartella
# Utilizzo:
# 	mkchk.sh <checklist-file> <dest-dir> <file-extension>
#
# Genera una copia del file <checklist-file>
# Per ogni file in <dest-dir> con estensione .<file-extension>
# Il file avrà lo stesso nome del file originale, con estensione ._checklist.txt
######################################################################

##########################
#OLD: funziona, ma non so bene perché
#function generate {
#	cmd="s/.$3/._checklist.txt/"
#	cp "$1" "$(echo $2 | sed $cmd)"
#	cp "$1" "${2%.$3}._checklist.txt"
#}

#export -f generate
#find "$2" -name "*.$3" -exec bash -c "generate \"$1\" \"{}\" \"$3\"" \;
#########################

find "$2" -name "*.$3" -exec sh -c 'cp "$0" "${1%.$2}._checklist.txt"' "$1" '{}' "$3" \;
