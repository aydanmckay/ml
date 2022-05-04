#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

2mass=/arc/projects/k-pop/pristine/xmatch/pristine_2mass.fits
catwise=/arc/projects/k-pop/pristine/xmatch/pristine_catwise_2020.fits
outfile=/arc/home/aydanmckay/pristine-2mass-catwise.fits

${stilts} tmatch2 \
        in1=${2mass} \
        icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK e_CaHK flag E_BV RAJ2000 DEJ2000 Jmag Hmag Kmag e_Jmag e_Hmag e_Kmag Qfl angDist'" \
        values1='RAJ2000 DEJ2000' \
        in2=${catwise} \
        icmd2="keepcols 'RAdeg DEdeg pmRA pmDE e_pmRA e_pmDE W1mproPM e_W1mproPM W2mproPM e_W2mproPM angDist'" \
        values2='RAdeg DEdeg' \
        matcher=sky \
        params=1.3 \
        join=1and2 \
        out=${outfile}
        
# alright well this isn't working. for some reason the path to the 2mass xmatch doesn't exist.