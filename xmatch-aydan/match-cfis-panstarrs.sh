#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

cfis=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits
pan=/arc/projects/k-pop/pristine/xmatch/pristine_unions_panstarrs_dr3.fits
outfile=/arc/home/aydanmckay/tables/pristine-cfis-panstarrs.fits

${stilts} tmatch2 \
        in1=${cfis} \
        values1='RA(CaHK) Dec(CaHK)' \
        in2=${pan} \
        icmd2="keepcols 'RA(CaHK) Dec(CaHK) i_ps i_ps_err Separation'; colmeta -name ra RA(CaHK); colmeta -name dec Dec(CaHK)" \
        values2='ra dec' \
        matcher=sky \
        params=1.3 \
        join=1and2 \
        out=${outfile}