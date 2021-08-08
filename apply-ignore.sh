#!/bin/sh
#
# Apply svn:ignore property
#
# Axey Gabriel Muller Endres
# 04 March 2020
#

if [ ! -f "svnignore" ]; then
    echo "File svnignore not found"
    exit 1
fi

svn propdel svn:ignore -R
svn propset --recursive svn:ignore -F svnignore .
