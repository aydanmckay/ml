#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

phots=/arc/home/aydanmckay/tables/pristine-xmatch-phottable-exact.fits
pans=/arc/home/aydanmckay/xmatch/pristine_panstarrs_dr1.fits
outfile=/arc/home/aydanmckay/tables/pristine-phottable-exact.fits

${stilts} tmatch2 \
        in1=${phots} \
        values1='ra dec CaHK' \
        in2=${pans} \
        icmd2="delcols 'e_CaHK flag objID RAJ2000 DEJ2000 errHalfMaj errHalfMin errPosAng f_objID Epoch Ns Nd gKmag e_gKmag rKmag e_rKmag iKmag e_iKmag zKmag e_zKmag yKmag e_yKmag'" \
        values2='RA(CaHK) Dec(CaHK) CaHK' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
        out=${outfile}