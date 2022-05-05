#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

mass=/arc/projects/k-pop/pristine/xmatch/pristine_2mass.fits
catwise=/arc/projects/k-pop/pristine/xmatch/pristine_catwise_2020.fits
outfile=/arc/home/aydanmckay/pristine-2mass-catwise-exact.fits

${stilts} tmatch2 \
        in1=${mass} \
        icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag E_BV RAJ2000 DEJ2000 Jmag Hmag Kmag e_Jmag e_Hmag e_Kmag Qfl angDist'" \
        values1='RA(CaHK) Dec(CaHK) CaHK_0' \
        in2=${catwise} \
        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 pmRA pmDE e_pmRA e_pmDE W1mproPM e_W1mproPM W2mproPM e_W2mproPM angDist'" \
        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
        out=${outfile}
