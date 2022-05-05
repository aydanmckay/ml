#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

pristine=/arc/projects/k-pop/pristine/Pristine_CaHK.fits
legacysurvey=/arc/projects/unions/catalogues/legacysurvey/legacysurvey_dr9.fits
outfile=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits

${stilts} tmatch2 \
       in1=${pristine} \
       icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${legacysurvey} \
       icmd2="delcols 'RA_IVAR DEC_IVAR Z_PHOT_MEDIAN Z_PHOT_STD SURVEY'" \
       values2='RA DEC' \
       matcher=sky \
       params=1.3 \
       join=all1 \
       ocmd="delcols 'RA DEC'" \
       out=${outfile}
