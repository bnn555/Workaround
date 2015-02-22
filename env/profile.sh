#!/bin/bash

if [ -n "$WORKAROUND_ENV_BASE" ]; then
   export WORKAROUND_BASE="$( cd "${WORKAROUND_ENV_BASE}/.." > /dev/null  && pwd )"
   cd ${WORKAROUND_BASE}
   return
fi

#C++ compiler
export WORKAROUND_CXX=/usr/bin/g++
export WORKAROUND_CXX_VER=gcc$(${WORKAROUND_CXX} -dumpversion)

export WORKAROUND_ENV_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null  && pwd )"
export WORKAROUND_BASE="$( cd "${WORKAROUND_ENV_BASE}/.." > /dev/null  && pwd )"
export WORKAROUND_CPP_BASE="${WORKAROUND_BASE}/cpp"

cd ${WORKAROUND_BASE}

export EDITOR=gedit


export WORKAROUND_PLATFORM=`uname -a | cut -d' ' -f1`"-"`arch`
export WORKAROUND_OPTIMIZE=${WORKAROUND_OPTIMIZE:-"DEBUG_OPTIMIZE"}
export BASE_TARGET=$WORKAROUND_PLATFORM-$WORKAROUND_CXX_VER
export TARGET=$BASE_TARGET-$WORKAROUND_OPTIMIZE

TERMTEST=${TERM:-"dumb"}
if [ "dumb" != $TERMTEST ]; then
   export LD_LIBRARY_PATH=.:${ICWP_LINUX}/lib64
fi

# IMAKEINCLUDE variable to search rules
export IMAKEINCLUDE=-I${WORKAROUND_ENV_BASE}

PATH=${WORKAROUND_ENV_BASE}:${WORKAROUND_ENV_BASE}/bin:$PATH
export PS1="[WKA] \$(pwd|awk -F'/' '{ print \$(NF-1)\"/\"\$NF }') \$ "

alias go='. go.sh'
