#!/bin/bash

if [ "$#" -eq 1 ] && [ "$1" == "-h" ]; then
	CMD=$(basename $0)
	echo "usage: ${CMD} <pattern>"
	echo ""
	echo "${CMD} matches the given pattern within the current directory subtree and changes the directory to the first shortest path match."
	echo "  First the exact <pattern>, with added leading and trailing wildcards is matched."
	echo "  If that yelds no results the given pattern is then split into separate words (by whitespaces and camelcase rules), with wildcards in-between."
	echo ""
	echo "Important note:"
	echo "  Execute with source (or ". ") before, in order to avoid launching a subshell and keeping the new location."
	echo ""
	echo "Examples:"
	echo "  ${CMD} S Cfg  # may change folder to Server/Cfg"
	echo "  ${CMD} SCfg   # same as ${CMD} S Cfg"
else
	if [ "$#" -eq 0 ]; then
		cd ${WORKAROUND_BASE}
		pwd
	elif [ "$1" == "wka" ]; then
		cd $WORKAROUND_CPP_BASE/Deployment/$TARGET
		pwd
	else
		MATCH=$(cd ${WORKAROUND_BASE} > /dev/null; match_dir.sh $@)

		if [ -n "${MATCH}" ]; then
			cd "${WORKAROUND_BASE}/${MATCH}"
			pwd
		else
			echo "No folder matches the given pattern" 1>&2
		fi
	fi
fi
