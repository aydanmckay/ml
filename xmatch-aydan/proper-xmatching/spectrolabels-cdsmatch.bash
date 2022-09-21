#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
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
# 

${stilts} cdsskymatch ifmt=csv \
        in=/arc/projects/k-pop/pristine/new_catalogues_220604/CaHKsynth_AllSky/CaHKsynth_all_EBVm0.5_220827.csv.gz \
        ofmt=fits \
        out=/arc/home/aydanmckay/intermediarytables/pristine_x_xpsummary.fits \
        ra="ra" \
        dec="dec" \
        radius=2 \
        cdstable=I/355/xpsummary \
        find=best

# ${stilts} cdsskymatch \
#         in=I/355/rvsmean \
#         ofmt=fits \
#         out=/arc/home/aydanmckay/intermediarytables/gaia-rvs_x_xpsummary.fits \
#         ra="RA" \
#         dec="DECLINATION" \
#         radius=2 \
#         cdstable=I/355/xpsummary \
#         find=best