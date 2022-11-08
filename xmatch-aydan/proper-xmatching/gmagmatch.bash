#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

in1=/arc/home/aydanmckay/input_catalogue_fullset_paramp.fits
in2=

${stilts} tmatch2 \
       ifmt1=fits \
       in1=${in1} \
       values1='source_id' \
       in2=${in2} \
       icmd2="keepcols 'source_id '" \
       values2='' \
       matcher=exact \
       join=all1 \
       out=$(outfile)
