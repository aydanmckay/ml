#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

catmass=/arc/home/aydanmckay/pristine-2mass-catwise-left.fits
galsdss=/arc/home/aydanmckay/pristine-sdssphot-galex-left.fits
outfile=/arc/home/aydanmckay/pristine-2mass-wise-sdss-galex-left.fits

${stilts} tmatch2 \
        in1=${catmass} \
        values1='RA(CaHK)_1 Dec(CaHK)_1' \
        in2=${galsdss} \
        values2='RA(CaHK)_1 Dec(CaHK)_1' \
        matcher=sky \
        params=1.3 \
        join=all1 \
        find=best \
        out=${outfile}
