#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

gaia=/arc/projects/k-pop/pristine/xmatch/pristine_gaia_edr3.fits
legacy=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits
outfile=/arc/home/aydanmckay/tables/pristine-legacy-gaiaedr3-exact.fits

${stilts} tmatch2 \
        in1=${legacy} \
        icmd1="colmeta -name ra RA(CaHK); colmeta -name dec Dec(CaHK)" \
        values1='ra dec CaHK' \
        in2=${gaia} \
        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 source_id E_BV parallax parallax_error pmra pmra_error pmdec pmdec_error phot_g_mean_mag phot_bp_mean_mag phot_rp_mean_mag dr2_radial_velocity dr2_radial_velocity_error phot_g_mean_mag_error phot_bp_mean_mag_error phot_rp_mean_mag_error angDist'" \
        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_0'" \
        out=${outfile}