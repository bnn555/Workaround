#!/bin/bash

if [ "$#" -eq 0 ] || ([ "$#" -eq 1 ] && [ "$1" == "-h" ]); then
	CMD=$(basename $0)
	echo "usage: ${CMD} <pattern>"
	echo ""
	echo "Matches the given pattern within the current directory subtree and outputs the first shortest path match."
	echo "  First the exact <pattern>, with added leading and trailing wildcards is matched."
	echo "  If that yelds no results the given pattern is then split into separate words (by whitespaces and camelcase rules), with wildcards in-between."
	echo ""
	echo "Examples:"
	echo "  ${CMD} S Cfg  # may match folder Server/Cfg"
	echo "  ${CMD} SCfg   # same as ${CMD} S Cfg"
	exit
fi

function getMinDir()
{
	local MIN_LEN=10000
	local MIN_DIR=""

	while IFS= read -r -d '' DIR; do
		local let LEN=${#DIR}

		if (("${LEN}" > 0)); then
			if (("${LEN}" < "${MIN_LEN}")); then
				let MIN_LEN=${LEN}
				MIN_DIR=${DIR}
			fi
		fi
	done

	echo ${MIN_DIR}
}

function getSimplePattern()
{
	local PATTERN=".*$@.*"
	echo "${PATTERN}"
}

function getPartsPattern()
{
	local PARTS=$(sed -e 's/\([A-Z]\)/ \1/g' -e 's/^-//'  <<< "$@")

	local PATTERN=""
	for PART in $PARTS; do
		PATTERN="${PATTERN}.*${PART}"
	done
	PATTERN="${PATTERN}.*"

	echo "${PATTERN}"
}

function printAndExitIfNotEmpty()
{
	if [ -n "$1" ]; then
		echo $@
		exit
	fi
}


PATTERN=$(getSimplePattern "$@")
MATCH=$(find . -type d -regex "${PATTERN}" -print0 | getMinDir)
printAndExitIfNotEmpty ${MATCH}

PATTERN=$(getPartsPattern "$@")
MATCH=$(find . -type d -regex "${PATTERN}" -print0 | getMinDir)
printAndExitIfNotEmpty ${MATCH}

echo "No matches found." 1>&2
