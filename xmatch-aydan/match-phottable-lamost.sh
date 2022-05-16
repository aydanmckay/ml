#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

phots=/arc/home/aydanmckay/tables/pristine-phottable-exact.fits
lamost=/arc/projects/k-pop/pristine/xmatch/pristine_lamost_dr8_gaiaedr3.fits
outfile=/arc/home/aydanmckay/tables/pristine-phottable-lamost.fits

${stilts} tmatch2 \
        in1=${phots} \
        values1='source_id' \
        in2=${lamost} \
        icmd2="delcols 'RA(CaHK) Dec(CaHK) CaHK_0 field_nb ccd_nb X_1 Y_1 e_CaHK flag E_BV parallax parallax_error pmra pmra_error pmdec pmdec_error phot_g_mean_mag phot_bp_mean_mag phot_rp_mean_mag dr2_radial_velocity dr2_radial_velocity_error phot_g_mean_mag_error phot_bp_mean_mag_error phot_rp_mean_mag_error'" \
        values2='source_id' \
        matcher=exact \
        join=1and2 \
        ocmd="delcols 'source_id_2 source_id_1'" \
        out=${outfile}