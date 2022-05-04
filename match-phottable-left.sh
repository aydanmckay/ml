#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

masswisesdssgalex=/arc/home/aydanmckay/pristine-2mass-wise-sdss-galex-left.fits
cfisgaialegacypans=/arc/home/aydanmckay/pristine-cfis-pans-gaia-legacy-left.fits
outfile=/arc/home/aydanmckay/pristine-xmatch-phottable-left.fits

${stilts} tmatch2 \
        in1=${masswisesdssgalex} \
        values1='RA(CaHK)_1_1 Dec(CaHK)_1_1' \
        in2=${cfisgaialegacypans} \
        values2='RA(CaHK)_1 Dec(CaHK)_1' \
        matcher=sky \
        params=1.3 \
        join=all1 \
        find=best \
        out=${outfile}