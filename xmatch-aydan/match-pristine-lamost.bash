#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"

dir=/arc/home/aydanmckay/xmatch/
in1=/arc/projects/k-pop/pristine/Pristine_CaHK.fits

########################
function outfile() {
    base1=$(basename ${in1})
    base1=${base1%.*}
    base2=$(basename ${in2})
    base2=${base2%.*}
    echo ${dir}/pristine-${base2}.fits
}

in2=/arc/projects/k-pop/catalogues/lamost-dr8-gaiaedr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       icmd1="delcols 'field_nb ccd_nb X Y'" \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       icmd2="delcols 'x y z r err_x err_y err_r err_z phi err_phi astrometric_n_good_obs_al astrometric_gof_al astrometric_chi2_al astrometric_excess_noise astrometric_excess_noise_sig astrometric_params_solved pseudocolour pseudocolour_error visibility_periods_used ruwe duplicated_source phot_g_mean_flux phot_g_mean_flux_error phot_bp_mean_flux phot_bp_mean_flux_error phot_rp_mean_flux phot_bp_rp_excess_factor bp_rp panstarrs1 sdssdr13 skymapper2 urat1 phot_g_mean_mag_corrected phot_g_mean_mag_error_corrected phot_g_mean_flux_corrected phot_bp_rp_excess_factor_corrected ra_epoch2000_error dec_epoch2000_error ra_dec_epoch2000_corr ra_epoch2000 dec_epoch2000 errHalfMaj errHalfMin errPosAng'" \
       values2='ra_obs dec_obs' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)