#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/apogee_x_xpsummary.fits
in2=/arc/home/aydanmckay/intermediarytables/gaia-eso_x_xpsummary.fits
in3=/arc/home/aydanmckay/intermediarytables/galah_x_xpsummary.fits
in4=/arc/home/aydanmckay/intermediarytables/legue_x_xpsummary.fits
in5=/arc/home/aydanmckay/intermediarytables/rave_x_xpsummary.fits
in6=/arc/home/aydanmckay/intermediarytables/segue_x_xpsummary.fits
outfile1=/arc/home/aydanmckay/intermediarytables/union-apoeso-xpsummary-table.fits
outfile2=/arc/home/aydanmckay/intermediarytables/union-galleg-xpsummary-table.fits
outfile3=/arc/home/aydanmckay/intermediarytables/union-ravseg-xpsummary-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_apo \
       icmd1="keepcols 'RA DEC RV_TEFF RV_LOGG RV_FEH RV_ALPHA TEFF TEFF_ERR TEFF_SPEC LOGG LOGG_ERR LOGG_SPEC FE_H FE_H_SPEC FE_H_ERR FE_H_FLAG ALPHA_M ALPHA_M_ERR Source angDist'" \
       values1='Source' \
       in2=${in2} \
       suffix2=_eso \
       icmd2="keepcols 'RA DECLINATION TEFF E_TEFF LOGG E_LOGG FEH E_FEH Source angDist'" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile1}

${stilts} tmatch2 \
       in1=${in3} \
       suffix1=_gal \
       icmd1="keepcols 'ra_dr2 dec_dr2 teff e_teff logg e_logg fe_h e_fe_h flag_fe_h alpha_fe e_alpha_fe flag_alpha_fe Source angDist'" \
       values1='Source' \
       in2=${in4} \
       suffix2=_leg \
       icmd2="keepcols 'ra_obs dec_obs FEH_APOGEE AFE_APOGEE LOGG_APOGEE TEFF_PASTEL LOGG_PASTEL FEH_PASTEL err_teff_pastel err_feh_pastel err_logg_pastel err_feh_apogee err_afe_apogee err_logg_apogee Source angDist_cds'" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile2}
    
${stilts} tmatch2 \
       in1=${in5} \
       suffix1=_rav \
       icmd1="keepcols 'ra_input dec_input teff_cal_madera teff_error_madera logg_cal_madera logg_error_madera m_h_cal_madera m_h_error_madera Source angDist'" \
       values1='Source' \
       in2=${in6} \
       suffix2=_seg \
       icmd2="keepcols 'PLUG_RA PLUG_DEC TEFF_SPEC TEFF_SPEC_UNC LOGG_SPEC LOGG_SPEC_UNC FEH_SPEC FEH_SPEC_UNC Source angDist'" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       out=${outfile3}