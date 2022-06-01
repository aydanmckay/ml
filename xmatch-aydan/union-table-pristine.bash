#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"

########################

in1=/arc/projects/k-pop/pristine/xmatch/pristine_gaia_edr3.fits
in2=/arc/projects/k-pop/pristine/xmatch/pristine_2mass.fits
outfile=/arc/home/aydanmckay/union-phot_only-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK E_BV parallax parallax_error pmra pmra_error pmdec pmdec_error phot_g_mean_mag phot_bp_mean_mag phot_rp_mean_mag dr2_radial_velocity dr2_radial_velocity_error phot_g_mean_mag_error phot_bp_mean_mag_error phot_rp_mean_mag_error angDist'; colmeta -name para_gaia parallax; colmeta -name para_gaia_err parallax_error; colmeta -name pmra_gaia pmra; colmeta -name pmra_gaia_err pmra_error; colmeta -name pmde_gaia pmdec; colmeta -name pmde_gaia_err pmdec_error; colmeta -name g_gaia phot_g_mean_mag; colmeta -name bp_gaia phot_bp_mean_mag; colmeta -name rp_gaia phot_rp_mean_mag; colmeta -name rv_gaia dr2_radial_velocity; colmeta -name rv_gaia_err dr2_radial_velocity_error; colmeta -name g_gaia_err phot_g_mean_mag_error; colmeta -name bp_gaia_err phot_bp_mean_mag_error; colmeta -name rp_gaia_err phot_rp_mean_mag_error; colmeta -name pris_gaia_sep angDist" \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 Jmag Hmag Kmag e_Jmag e_Hmag e_Kmag Qfl angDist'; colmeta -name j_mass Jmag; colmeta -name h_mass Hmag; colmeta -name k_mass Kmag; colmeta -name j_mass_err e_Jmag; colmeta -name h_mass_err e_Hmag; colmeta -name k_mass_err e_Kmag; colmeta -name qfl_mass Qfl; colmeta -name pris_mass_sep angDist" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK)_2 Dec(CaHK)_2 CaHK_0_2'; colmeta -name ra RA(CaHK)_1; colmeta -name dec Dec(CaHK)_1; colmeta -name CaHK CaHK_0_1" \
       out=${outfile}
       
in1=/arc/home/aydanmckay/union-phot_only-table.fits
in2=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK u_cfht r_cfht u_cfht_err r_cfht_err Separation'; colmeta -name pris_cfis_sep Separation" \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
       out=${outfile}
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_unions_panstarrs_dr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK i_ps i_ps_err Separation'; colmeta -name i_pan3 i_ps; colmeta -name i_pan3_err i_ps_err; colmeta -name pris_pan3_sep Separation" \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
       out=${outfile}

in2=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK TYPE FLUX_G FLUX_R FLUX_Z FLUX_W1 FLUX_W2 FLUX_W3 FLUX_W4 FLUX_IVAR_G FLUX_IVAR_R FLUX_IVAR_Z FLUX_IVAR_W1 FLUX_IVAR_W2 FLUX_IVAR_W3 FLUX_IVAR_W4 Z_SPEC Separation'; colmeta -name type_desi TYPE; colmeta -name gflx_desi FLUX_G; colmeta -name rflx_desi FLUX_R; colmeta -name zflx_desi FLUX_Z; colmeta -name w1flx_desi FLUX_W1; colmeta -name w2flx_desi FLUX_W2; colmeta -name w3flx_desi FLUX_W3; colmeta -name w4flx_desi FLUX_W4; colmeta -name gflx_desi_err FLUX_IVAR_G;  colmeta -name rflx_desi_err FLUX_IVAR_R; colmeta -name zflx_desi_err FLUX_IVAR_Z; colmeta -name w1flx_desi_err FLUX_IVAR_W1; colmeta -name w2flx_desi_err FLUX_IVAR_W2; colmeta -name w3flx_desi_err FLUX_IVAR_W3; colmeta -name w4flx_desi_err FLUX_IVAR_W4; colmeta -name zspec_desi Z_SPEC; colmeta -name pris_desi_sep Separation" \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
       out=${outfile}
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_photobj_dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 umag gmag rmag imag zmag e_umag e_gmag e_rmag e_imag e_zmag pmRA pmDE e_pmRA e_pmDE angDist'; colmeta -name u_sdss umag; colmeta -name g_sdss gmag; colmeta -name r_sdss rmag; colmeta -name i_sdss imag; colmeta -name z_sdss zmag; colmeta -name u_sdss_err e_umag; colmeta -name g_sdss_err e_gmag; colmeta -name r_sdss_err e_rmag; colmeta -name i_sdss_err e_imag; colmeta -name z_sdss_err e_zmag; colmeta -name pmra_sdss pmRA; colmeta -name pmde_sdss pmDE; colmeta -name pmra_sdss_err e_pmRA; colmeta -name pmde_sdss_err e_pmDE; colmeta -name pris_sdssp_sep angDist" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_0'" \
       out=${outfile}
       
in2=/arc/home/aydanmckay/xmatch/pristine_panstarrs_dr1.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK gmag e_gmag rmag e_rmag imag e_imag zmag e_zmag ymag e_ymag angDist'; colmeta -name g_pan1 gmag; colmeta -name g_pan1_err e_gmag; colmeta -name r_pan1 rmag; colmeta -name r_pan1_err e_rmag; colmeta -name i_pan1 imag; colmeta -name i_pan1_err e_imag; colmeta -name z_pan1 zmag; colmeta -name z_pan1_err e_zmag; colmeta -name y_pan1 ymag; colmeta -name y_pan1_err e_ymag; colmeta -name pris_pan1_sep angDist" \
       values2='RA(CaHK) Dec(CaHK) CaHK' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
       out=${outfile}
       
in2=/arc/projects/k-pop/pristine/xmatch/pristine_galex_gr67.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='ra dec CaHK' \
       in2=${in2} \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 FUVmag e_FUVmag NUVmag e_NUVmag angDist'; colmeta -name fuv_galex FUVmag; colmeta -name fuv_galex_err e_FUVmag; colmeta -name nuv_galex NUVmag; colmeta -name nuv_galex_err e_NUVmag; colmeta -name pris_galex_sep angDist" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join=1and2 \
       ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_0'" \
       out=${outfile}

# in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_apogee_dr17.fits

# ${stilts} tmatch2 \
#        in1=${in1} \
#        values1='ra dec CaHK' \
#        in2=${in2} \
#        suffix2=_apo \
#        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 RV_TEFF RV_LOGG RV_FEH RV_ALPHA TEFF TEFF_ERR LOGG LOGG_ERR M_H M_H_ERR ALPHA_M ALPHA_M_ERR FE_H FE_H_SPEC FE_H_ERR Separation; colmeta -name pris_sep Separation'" \
#        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
#        matcher=exact+exact+exact \
#        join=1and2 \
#        ocmd="delcols 'RA(CaHK)_apo Dec(CaHK)_apo CaHK_0_apo'" \
#        out=${outfile}
       
# in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_sspp_dr17.fits

# ${stilts} tmatch2 \
#        in1=${in1} \
#        values1='ra dec CaHK' \
#        in2=${in2} \
#        suffix2=_sspp \
#        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 EBV TEFF_SPEC TEFF_SPEC_UNC LOGG_SPEC LOGG_SPEC_UNC FEH_SPEC FEH_SPEC_UNC Separation; colmeta -name pris_sep Separation'" \
#        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
#        matcher=exact+exact+exact \
#        join=1and2 \
#        ocmd="delcols 'RA(CaHK)_sspp Dec(CaHK)_sspp CaHK_0_sspp'" \
#        out=${outfile}

# in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_specobj_dr17.fits

# ${stilts} tmatch2 \
#        in1=${in1} \
#        values1='ra dec CaHK' \
#        in2=${in2} \
#        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 CLASS SUBCLASS Z Z_ERR Separation'; colmeta -name class_sdss CLASS; colmeta -name subclass_sdss SUBCLASS; colmeta -name z_sdss Z; colmeta -name z_sdss_err Z_ERR; colmeta -name pris_sdsss_sep Separation" \
#        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
#        matcher=exact+exact+exact \
#        join=1and2 \
#        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_0'" \
#        out=${outfile}

       
# in2=/arc/projects/k-pop/pristine/xmatch/pristine_lamost_dr8_gaiaedr3.fits

# ${stilts} tmatch2 \
#        in1=${in1} \
#        values1='ra dec CaHK' \
#        in2=${in2} \
#        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 TEFF_PASTEL LOGG_PASTEL FEH_PASTEL rv err_rv err_teff_pastel err_feh_pastel err_logg_pastel Separation'; colmeta -name teff_past_lam TEFF_PASTEL; colmeta -name logg_past_lam LOGG_PASTEL; colmeta -name feh_past_lam FEH_PASTEL; colmeta -name rv_lam rv; colmeta -name rv_lam_err err_rv; colmeta -name teff_past_lam_err err_teff_pastel; colmeta -name feh_past_lam_err err_feh_pastel; colmeta -name logg_past_lam_err err_logg_pastel; colmeta -name pris_sdsss_sep Separation" \
#        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
#        matcher=exact+exact+exact \
#        join=1and2 \
#        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_0'" \
#        out=${outfile}