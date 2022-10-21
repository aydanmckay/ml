#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/apogee_x_paramp.fits
in2=/arc/home/aydanmckay/intermediarytables/gaia-eso_x_paramp.fits
in3=/arc/home/aydanmckay/intermediarytables/galah_x_paramp.fits
in4=/arc/home/aydanmckay/intermediarytables/legue_x_paramp.fits
in5=/arc/home/aydanmckay/intermediarytables/rave_x_paramp.fits
in6=/arc/home/aydanmckay/intermediarytables/segue_x_paramp.fits
outfile1=/arc/home/aydanmckay/intermediarytables/union-apoeso-paramp-table.fits
outfile2=/arc/home/aydanmckay/intermediarytables/union-galleg-paramp-table.fits
outfile3=/arc/home/aydanmckay/intermediarytables/union-ravseg-paramp-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_apo \
       icmd1="keepcols 'RA DEC RV_TEFF RV_LOGG RV_FEH RV_ALPHA TEFF_in TEFF_ERR TEFF_SPEC LOGG_in LOGG_ERR LOGG_SPEC FE_H FE_H_SPEC FE_H_ERR FE_H_FLAG ALPHA_M ALPHA_M_ERR Source Teff_cds logg_cds [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff_cds; colmeta -name logg_xp logg_cds; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values1='Source' \
       in2=${in2} \
       suffix2=_eso \
       icmd2="keepcols 'RA DECLINATION TEFF_in E_TEFF LOGG_in E_LOGG FEH E_FEH Source Teff_cds logg_cds [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff_cds; colmeta -name logg_xp logg_cds; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile1}

${stilts} tmatch2 \
       in1=${in3} \
       suffix1=_gal \
       icmd1="keepcols 'ra_dr2 dec_dr2 teff_in e_teff logg_in e_logg fe_h e_fe_h flag_fe_h alpha_fe e_alpha_fe flag_alpha_fe Source Teff_cds logg_cds [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff_cds; colmeta -name logg_xp logg_cds; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values1='Source' \
       in2=${in4} \
       suffix2=_leg \
       icmd2="keepcols 'ra_obs dec_obs FEH_APOGEE AFE_APOGEE LOGG_APOGEE TEFF_PASTEL LOGG_PASTEL FEH_PASTEL err_teff_pastel err_feh_pastel err_logg_pastel err_feh_apogee err_afe_apogee err_logg_apogee Source Teff logg [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist_cds'; colmeta -name teff_xp Teff; colmeta -name logg_xp logg; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile2}
    
${stilts} tmatch2 \
       in1=${in5} \
       suffix1=_rav \
       icmd1="keepcols 'ra_input dec_input teff_cal_madera teff_error_madera logg_cal_madera logg_error_madera m_h_cal_madera m_h_error_madera Source Teff logg [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff; colmeta -name logg_xp logg; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values1='Source' \
       in2=${in6} \
       suffix2=_seg \
       icmd2="keepcols 'PLUG_RA PLUG_DEC TEFF_SPEC TEFF_SPEC_UNC LOGG_SPEC LOGG_SPEC_UNC FEH_SPEC FEH_SPEC_UNC Source Teff logg [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff; colmeta -name logg_xp logg; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile3}