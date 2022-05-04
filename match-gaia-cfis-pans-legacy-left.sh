#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

gaialeg=/arc/home/aydanmckay/pristine-legacy-gaiaedr3-left.fits
cfispan=/arc/home/aydanmckay/pristine-cfis-panstarrs-left.fits
outfile=/arc/home/aydanmckay/pristine-cfis-pans-gaia-legacy-left.fits

${stilts} tmatch2 \
        in1=${gaialeg} \
        values1='RA(CaHK)_1 Dec(CaHK)_1' \
        in2=${cfispan} \
        values2='RA(CaHK) Dec(CaHK)' \
        matcher=sky \
        params=1.3 \
        join=all1 \
        find=best \
        out=${outfile}