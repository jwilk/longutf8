#!/usr/bin/env bash

# Copyright © 2020 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
pdir="${0%/*}/.."
prog="$pdir/longutf8"
echo 1..1
xout=$'\301\245\301\247\301\247\301\263'
out=$("$prog" eggs)
hd=$(hd <<< "$out")
sed -e 's/^/# /' <<< "$hd"
if [ "$out" = "$xout" ]
then
    echo 'ok 1'
else
    echo 'not ok 1'
fi

# vim:ts=4 sts=4 sw=4 et ft=sh
