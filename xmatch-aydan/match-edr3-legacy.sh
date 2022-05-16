#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

gaia=/arc/projects/k-pop/pristine/xmatch/pristine_gaia_edr3.fits
legacy=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits
outfile=/arc/home/aydanmckay/tables/pristine-legacy-gaiaedr3.fits

${stilts} tmatch2 \
        in1=${legacy} \
        values1='RA(CaHK) Dec(CaHK)' \
        in2=${gaia} \
        icmd2="keepcols 'E_BV ra dec parallax parallax_error pmra pmra_error pmdec pmdec_error phot_g_mean_mag phot_bp_mean_mag phot_rp_mean_mag dr2_radial_velocity dr2_radial_velocity_error phot_g_mean_mag_error phot_bp_mean_mag_error phot_rp_mean_mag_error angDist'" \
        values2='ra dec' \
        matcher=sky \
        params=1.3 \
        join=1and2 \
        out=${outfile}

