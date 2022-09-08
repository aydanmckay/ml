#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
# in1=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_sspp_dr17.fits
# in2=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_apogee_dr17.fits
# in3=/arc/projects/k-pop/pristine/xmatch/pristine_lamost_dr8_gaiaedr3.fits
# outfile=/arc/home/aydanmckay/intermediarytables/union-spec-pris-table.fits

# ${stilts} tmatchn nin=3 \
#        in1=${in1} \
#        suffix1=_sspp \
#        icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 EBV TEFF_SPEC TEFF_SPEC_UNC LOGG_SPEC LOGG_SPEC_UNC FEH_SPEC FEH_SPEC_UNC Separation'; colmeta -name pris_sep Separation" \
#        values1='RA(CaHK) Dec(CaHK) CaHK_0' \
#        in2=${in2} \
#        suffix2=_apo \
#        icmd2="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 RV_TEFF RV_LOGG RV_FEH RV_ALPHA TEFF TEFF_ERR LOGG LOGG_ERR M_H M_H_ERR ALPHA_M ALPHA_M_ERR FE_H FE_H_SPEC FE_H_ERR Separation'; colmeta -name pris_sep Separation" \
#        values2='RA(CaHK) Dec(CaHK) CaHK_0' \
#        in3=${in3} \
#        suffix3=_lam \
#        icmd3="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 source_id TEFF_PASTEL LOGG_PASTEL FEH_PASTEL rv err_rv err_teff_pastel err_feh_pastel err_logg_pastel Separation'; colmeta -name teff_past TEFF_PASTEL; colmeta -name logg_past LOGG_PASTEL; colmeta -name feh_past FEH_PASTEL; colmeta -name rv_err err_rv; colmeta -name teff_past_err err_teff_pastel; colmeta -name feh_past_err err_feh_pastel; colmeta -name logg_past_err err_logg_pastel; colmeta -name pris_sep Separation; colmeta -name gaia_source_id source_id" \
#        values3='RA(CaHK) Dec(CaHK) CaHK_0' \
#        matcher=exact+exact+exact \
#        join1=always \
#        ocmd="delcols 'RA(CaHK)_apo Dec(CaHK)_apo CaHK_0_apo RA(CaHK)_lam Dec(CaHK)_lam CaHK_0_lam'; colmeta -name ra RA(CaHK)_sspp; colmeta -name dec Dec(CaHK)_sspp; colmeta -name CaHK CaHK_0_sspp" \
#        out=${outfile}



${stilts} cdsskymatch ifmt=fits \
        in=/arc/projects/k-pop/catalogues/galah-dr3v2.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/galah_x_xpsummary.fits \
        ra="ra_dr2" \
        dec="dec_dr2" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best
        
${stilts} cdsskymatch ifmt=fits \
        in=/arc/projects/k-pop/catalogues/lamost-dr8-gaiaedr3.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/legue_x_xpsummary.fits \
        ra="ra_obs" \
        dec="dec_obs" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best

${stilts} cdsskymatch ifmt=fits \
        in=/arc/projects/k-pop/catalogues/sdss-apogee-dr17.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/apogee_x_xpsummary.fits \
        ra="RA" \
        dec="DEC" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best

${stilts} cdsskymatch ifmt=fits \
        in=/arc/projects/k-pop/catalogues/sdss-sspp-dr17.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/segue_x_xpsummary.fits \
        ra="PLUG_RA" \
        dec="PLUG_DEC" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best
        
${stilts} cdsskymatch ifmt=fits \
        in=/arc/home/aydanmckay/rave_dr6_madera_new.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/rave_x_xpsummary.fits \
        ra="ra_input" \
        dec="dec_input" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best

${stilts} cdsskymatch ifmt=fits \
        in=/arc/projects/k-pop/catalogues/ges_idr5.fits \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/gaia-eso_x_xpsummary.fits \
        ra="RA" \
        dec="DECLINATION" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best