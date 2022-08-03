#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_sspp_dr17.fits
in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_apogee_dr17.fits
in3=/arc/projects/k-pop/pristine/xmatch/pristine_lamost_dr8_gaiaedr3.fits
in4=/arc/projects/k-pop/pristine/xmatch/pristine_gaia_edr3.fits
in5=/arc/projects/k-pop/pristine/xmatch/pristine_2mass.fits
in6=/arc/projects/k-pop/pristine/xmatch/pristine_unions_cfis_dr3.fits
in7=/arc/projects/k-pop/pristine/xmatch/pristine_unions_panstarrs_dr3.fits
in8=/arc/projects/k-pop/pristine/xmatch/pristine_legacysurvey_dr9.fits
in9=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_photobj_dr17.fits
in10=/arc/home/aydanmckay/xmatch/pristine_panstarrs_dr1.fits
in11=/arc/projects/k-pop/pristine/xmatch/pristine_galex_gr67.fits
in12=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_specobj_dr17.fits
outfile=/arc/home/aydanmckay/union-spec-phot-table.fits

${stilts} tmatchn nin=12 \
       in1=${in1} \
       suffix1=_sspp \
       icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 EBV TEFF_SPEC TEFF_SPEC_UNC LOGG_SPEC LOGG_SPEC_UNC FEH_SPEC FEH_SPEC_UNC Separation'; colmeta -name pris_sep Separation" \
       values1='RA(CaHK) Dec(CaHK) CaHK_0' \
       in2=${in2} \
       suffix2=_apo \
       icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 RV_TEFF RV_LOGG RV_FEH RV_ALPHA TEFF TEFF_ERR LOGG LOGG_ERR M_H M_H_ERR ALPHA_M ALPHA_M_ERR FE_H FE_H_SPEC FE_H_ERR Separation'; colmeta -name pris_sep Separation" \
       values2='RA(CaHK) Dec(CaHK) CaHK_0' \
       in3=${in3} \
       suffix3=_lam \
       icmd3="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 source_id TEFF_PASTEL LOGG_PASTEL FEH_PASTEL rv err_rv err_teff_pastel err_feh_pastel err_logg_pastel Separation'; colmeta -name teff_past TEFF_PASTEL; colmeta -name logg_past LOGG_PASTEL; colmeta -name feh_past FEH_PASTEL; colmeta -name rv_err err_rv; colmeta -name teff_past_err err_teff_pastel; colmeta -name feh_past_err err_feh_pastel; colmeta -name logg_past_err err_logg_pastel; colmeta -name pris_sep Separation; colmeta -name gaia_source_id source_id" \
       values3='RA(CaHK) Dec(CaHK) CaHK_0' \
       in4=${in4} \
       suffix4=_gaia \
       icmd4="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK E_BV source_id parallax parallax_error pmra pmra_error pmdec pmdec_error phot_g_mean_mag phot_bp_mean_mag phot_rp_mean_mag dr2_radial_velocity dr2_radial_velocity_error phot_g_mean_mag_error phot_bp_mean_mag_error phot_rp_mean_mag_error angDist'; colmeta -name para parallax; colmeta -name para_err parallax_error; colmeta -name pmra_err pmra_error; colmeta -name pmde pmdec; colmeta -name pmde_err pmdec_error; colmeta -name g phot_g_mean_mag; colmeta -name bp phot_bp_mean_mag; colmeta -name rp phot_rp_mean_mag; colmeta -name rv dr2_radial_velocity; colmeta -name rv_err dr2_radial_velocity_error; colmeta -name g_err phot_g_mean_mag_error; colmeta -name bp_err phot_bp_mean_mag_error; colmeta -name rp_err phot_rp_mean_mag_error; colmeta -name pris_sep angDist; colmeta -name source_id source_id" \
       values4='RA(CaHK) Dec(CaHK) CaHK_0' \
       in5=${in5} \
       suffix5=_mass \
       icmd5="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 Jmag Hmag Kmag e_Jmag e_Hmag e_Kmag Qfl angDist'; colmeta -name j Jmag; colmeta -name h Hmag; colmeta -name k Kmag; colmeta -name j_err e_Jmag; colmeta -name h_err e_Hmag; colmeta -name k_err e_Kmag; colmeta -name qfl Qfl; colmeta -name pris_sep angDist" \
       values5='RA(CaHK) Dec(CaHK) CaHK_0' \
       in6=${in6} \
       suffix6=_cf3 \
       icmd6="keepcols 'RA(CaHK) Dec(CaHK) CaHK u_cfht r_cfht u_cfht_err r_cfht_err Separation'; colmeta -name pris_sep Separation" \
       values6='RA(CaHK) Dec(CaHK) CaHK' \
       in7=${in7} \
       suffix7=_ps3 \
       icmd7="keepcols 'RA(CaHK) Dec(CaHK) CaHK i_ps i_ps_err Separation'; colmeta -name i i_ps; colmeta -name i_err i_ps_err; colmeta -name pris_sep Separation" \
       values7='RA(CaHK) Dec(CaHK) CaHK' \
       in8=${in8} \
       suffix8=_desi \
       icmd8="keepcols 'RA(CaHK) Dec(CaHK) CaHK TYPE FLUX_G FLUX_R FLUX_Z FLUX_W1 FLUX_W2 FLUX_W3 FLUX_W4 FLUX_IVAR_G FLUX_IVAR_R FLUX_IVAR_Z FLUX_IVAR_W1 FLUX_IVAR_W2 FLUX_IVAR_W3 FLUX_IVAR_W4 Z_SPEC Separation'; colmeta -name type TYPE; colmeta -name gflx FLUX_G; colmeta -name rflx FLUX_R; colmeta -name zflx FLUX_Z; colmeta -name w1flx FLUX_W1; colmeta -name w2flx FLUX_W2; colmeta -name w3flx FLUX_W3; colmeta -name w4flx FLUX_W4; colmeta -name gflx_err FLUX_IVAR_G;  colmeta -name rflx_err FLUX_IVAR_R; colmeta -name zflx_err FLUX_IVAR_Z; colmeta -name w1flx_err FLUX_IVAR_W1; colmeta -name w2flx_err FLUX_IVAR_W2; colmeta -name w3flx_err FLUX_IVAR_W3; colmeta -name w4flx_err FLUX_IVAR_W4; colmeta -name zspec Z_SPEC; colmeta -name pris_sep Separation" \
       values8='RA(CaHK) Dec(CaHK) CaHK' \
       in9=${in9} \
       suffix9=_sdsp \
       icmd9="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 umag gmag rmag imag zmag e_umag e_gmag e_rmag e_imag e_zmag pmRA pmDE e_pmRA e_pmDE angDist'; colmeta -name u umag; colmeta -name g gmag; colmeta -name r rmag; colmeta -name i imag; colmeta -name z zmag; colmeta -name u_err e_umag; colmeta -name g_err e_gmag; colmeta -name r_err e_rmag; colmeta -name i_err e_imag; colmeta -name z_err e_zmag; colmeta -name pmra pmRA; colmeta -name pmde pmDE; colmeta -name pmra_err e_pmRA; colmeta -name pmde_err e_pmDE; colmeta -name pris_sep angDist" \
       values9='RA(CaHK) Dec(CaHK) CaHK_0' \
       in10=${in10} \
       suffix10=_ps1 \
       icmd10="keepcols 'RA(CaHK) Dec(CaHK) CaHK gmag e_gmag rmag e_rmag imag e_imag zmag e_zmag ymag e_ymag angDist'; colmeta -name g gmag; colmeta -name g_err e_gmag; colmeta -name r rmag; colmeta -name r_err e_rmag; colmeta -name i imag; colmeta -name i_err e_imag; colmeta -name z zmag; colmeta -name z_err e_zmag; colmeta -name y ymag; colmeta -name y_err e_ymag; colmeta -name pris_sep angDist" \
       values10='RA(CaHK) Dec(CaHK) CaHK' \
       in11=${in11} \
       suffix11=_galx \
       icmd11="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 FUVmag e_FUVmag NUVmag e_NUVmag angDist'; colmeta -name fuv FUVmag; colmeta -name fuv_err e_FUVmag; colmeta -name nuv NUVmag; colmeta -name nuv_err e_NUVmag; colmeta -name pris_sep angDist" \
       values11='RA(CaHK) Dec(CaHK) CaHK_0' \
       in12=${in12} \
       suffix12=_sdss \
       icmd12="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 CLASS SUBCLASS Z Z_ERR Separation'; colmeta -name class_sdss CLASS; colmeta -name subclass_sdss SUBCLASS; colmeta -name z_sdss Z; colmeta -name z_sdss_err Z_ERR; colmeta -name pris_sdsss_sep Separation" \
       values12='RA(CaHK) Dec(CaHK) CaHK_0' \
       matcher=exact+exact+exact \
       join1=always \
       ocmd="delcols 'RA(CaHK)_apo Dec(CaHK)_apo CaHK_0_apo RA(CaHK)_lam Dec(CaHK)_lam CaHK_0_lam RA(CaHK)_gaia Dec(CaHK)_gaia CaHK_0_gaia RA(CaHK)_mass Dec(CaHK)_mass CaHK_0_mass RA(CaHK)_cf3 Dec(CaHK)_cf3 CaHK_cf3 RA(CaHK)_ps3 Dec(CaHK)_ps3 CaHK_ps3 RA(CaHK)_desi Dec(CaHK)_desi CaHK_desi RA(CaHK)_sdsp Dec(CaHK)_sdsp CaHK_0_sdsp RA(CaHK)_ps1 Dec(CaHK)_ps1 CaHK_ps1 RA(CaHK)_galx Dec(CaHK)_galx CaHK_0_galx RA(CaHK)_sdss Dec(CaHK)_sdss CaHK_0_sdss'; colmeta -name ra RA(CaHK)_sspp; colmeta -name dec Dec(CaHK)_sspp; colmeta -name CaHK CaHK_0_sspp" \
       out=${outfile}