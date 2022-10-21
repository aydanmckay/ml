#!/bin/bash
# 

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

########################
in1=/arc/home/aydanmckay/intermediarytables/apoeso-paramp-table2.fits
in2=/arc/home/aydanmckay/intermediarytables/ravseg-paramp-table2.fits
in3=/arc/home/aydanmckay/intermediarytables/galleg-paramp-table2.fits
in4=/arc/home/aydanmckay/intermediarytables/pristine_x_paramp.fits
intfile1=/arc/home/aydanmckay/intermediarytables/apoesoravseg-paramp-table.fits
intfile2=/arc/home/aydanmckay/intermediarytables/gallegpristn-paramp-table.fits

${stilts} tmatch2 \
       in1=${in1} \
       suffix1=_apoeso \
       values1='Source' \
       in2=${in2} \
       suffix2=_ravseg \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       ocmd="delcols 'Source_seg Source_rav'" \
       out=${intfile1}
       
${stilts} tmatch2 \
       in1=${in3} \
       suffix1=_galleg \
       values1='Source' \
       in2=${in4} \
       suffix2=_pristn \
       icmd2="keepcols 'ragaia decgaia FeHphot_gen FeHphot_dwarf FeHphot_giant Source Teff logg [Fe/H] Dist A0 Teff-S logg-S [M/H]-S [alpha/Fe]-S [Fe/H]-S angDist'; colmeta -name teff_xp Teff; colmeta -name logg_xp logg; colmeta -name fe/h_xp [Fe/H]; colmeta -name teff_rvs Teff-S; colmeta -name logg_rvs logg-S; colmeta -name m/h_rvs [M/H]-S; colmeta -name a/fe_rvs [alpha/Fe]-S; colmeta -name fe/h_rvs [Fe/H]-S" \
       values2='Source' \
       matcher=exact \
       join=1or2 \
       ocmd="delcols 'Source_leg Source_gal'" \
       out=${intfile2}
       
