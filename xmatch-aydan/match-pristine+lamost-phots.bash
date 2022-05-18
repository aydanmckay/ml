#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"

dir=/arc/home/aydanmckay/xmatch/
in1=/arc/home/aydanmckay/xmatch/pristine-lamost-gaia-inter.fits

########################
function outfile() {
    base2=$(basename ${in2})
    base2=${base2%.*}
    echo ${dir}/inter-lamost-gaia-${base2}.fits
}

in2=/arc/projects/k-pop/pristine/xmatch/pristine_2mass.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag E_BV RAJ2000 DEJ2000 Jmag Hmag Kmag e_Jmag e_Hmag e_Kmag Qfl angDist'" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
       out=$(outfile)
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_catwise_2020.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 pmRA pmDE e_pmRA e_pmDE W1mproPM e_W1mproPM W2mproPM e_W2mproPM angDist'" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
       out=$(outfile)
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0" \
       out=$(outfile)
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_unions_panstarrs_dr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0" \
       out=$(outfile)

in2=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0" \
       out=$(outfile)
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_photobj_dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag E_BV umag gmag rmag imag zmag e_umag e_gmag e_rmag e_imag e_zmag pmRA pmDE e_pmRA e_pmDE angDist'" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
       out=$(outfile)
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_galex_gr67.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 E(B-V) FUVmag e_FUVmag NUVmag e_NUVmag angDist'" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
       out=$(outfile)
       
in2=/arc/home/aydanmckay/xmatch/pristine_panstarrs_dr1.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="delcols 'e_CaHK flag objID RAJ2000 DEJ2000 errHalfMaj errHalfMin errPosAng f_objID Epoch Ns Nd gKmag e_gKmag rKmag e_rKmag iKmag e_iKmag zKmag e_zKmag yKmag e_yKmag'" \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0" \
       out=$(outfile)