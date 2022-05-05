#!/bin/bash

ephemeral=/scratch

stilts="stilts -Xmx80G -Djava.io.tmpdir=${ephemeral} -verbose"

pristine="/arc/projects/k-pop/pristine/Pristine_CaHK.fits"
cfis="/arc/projects/unions/catalogues/unions/cfis_dr3.fits"
outfile="/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits"


${stilts} tmatch2 \
       in1=${pristine} \
       icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${cfis} \
       values2='ra dec' \
       matcher=sky \
       params=1 \
       join=all1 \
       ocmd="delcols 'id ra dec'" \
       out=${outfile}
