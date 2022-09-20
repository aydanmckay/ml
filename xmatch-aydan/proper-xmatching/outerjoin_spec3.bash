#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/aers-xpsummary-table2.fits
in2=/arc/home/aydanmckay/intermediarytables/galleg-xpsummary-table2.fits
outfile=/arc/home/aydanmckay/intermediarytables/spec-xpsummary-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_aers \
       values1='Source' \
       in2=${in2} \
       suffix2=_galleg \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       ocmd="delcols 'Source_apoeso Source_ravseg'" \
       out=${outfile}