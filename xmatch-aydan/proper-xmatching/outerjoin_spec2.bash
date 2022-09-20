#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/apoeso-xpsummary-table2.fits
in2=/arc/home/aydanmckay/intermediarytables/ravseg-xpsummary-table2.fits
intfile=/arc/home/aydanmckay/intermediarytables/apoesoravseg-xpsummary-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_apoeso \
       values1='Source' \
       in2=${in2} \
       suffix2=_ravseg \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       ocmd="delcols 'Source_seg Source_rav'" \
       out=${intfile}