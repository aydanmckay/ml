#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

cfis=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits
legacy=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits
outfile=/arc/home/aydanmckay/tables/pristine-cfis-legacy-exact.fits

${stilts} tmatch2 \
        in1=${cfis} \
        values1='RA(CaHK) Dec(CaHK) CaHK' \
        in2=${legacy} \
        values2='RA(CaHK) Dec(CaHK) CaHK' \
        matcher=exact+exact+exact \
        join=all1 \
        out=${outfile}