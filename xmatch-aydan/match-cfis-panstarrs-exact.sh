#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

cfis=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits
pan=/arc/projects/k-pop/pristine/xmatch/pristine_unions_panstarrs_dr3.fits
outfile=/arc/home/aydanmckay/pristine-cfis-panstarrs-exact.fits

${stilts} tmatch2 \
        in1=${cfis} \
        values1='RA(CaHK) Dec(CaHK) CaHK' \
        in2=${pan} \
        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK i_ps i_ps_err Separation'; colmeta -name ra RA(CaHK); colmeta -name dec Dec(CaHK)" \
        values2='ra dec CaHK' \
        matcher=exact+exact+exact \
        join=all1 \
        ocmd="delcols 'ra dec CaHK_2'; colmeta -name CaHK CaHK_1" \
        out=${outfile}