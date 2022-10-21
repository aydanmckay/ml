#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/aers-paramp-table2.fits
in2=/arc/home/aydanmckay/intermediarytables/glp-paramp-table2.fits
outfile=/arc/home/aydanmckay/intermediarytables/spec-paramp-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_aers \
       values1='Source' \
       in2=${in2} \
       suffix2=_glp \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       ocmd="delcols 'Source_apoeso Source_ravseg Source_galleg Source_pristn'" \
       out=${outfile}