#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

phots=/arc/home/aydanmckay/pristine-xmatch-phottable-exact.fits
lamost=/arc/projects/k-pop/pristine/xmatch/
outfile=/arc/home/aydanmckay/pristine-phottable-lamost.fits

${stilts} tmatch2 \
        in1=${phots} \
        values1='ra dec CaHK' \
        in2=${lamost} \
        icmd2="delcols 'e_CaHK flag '" \
        values2='RA(CaHK) Dec(CaHK) CaHK' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
        out=${outfile}