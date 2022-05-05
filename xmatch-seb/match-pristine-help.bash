#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${ephemeral} -verbose"

pristine="/arc/projects/k-pop/pristine/Pristine_CaHK.fits"
help="/arc/projects/unions/catalogues/help/HELP-SPECZ_20180720.fits"
outfile="/arc/projects/k-pop/pristine/xmatch/pristine_help_dr1.fits"

# spec redshifts
${stilts} tmatch2 \
       in1=${pristine} \
       icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${help} \
       values2='ra dec' \
       icmd2="keepcols 'ra dec z_qual field z_spec z_rel agn_flag'" \
       matcher=sky \
       params=1 \
	   join=all1 \
       ocmd="delcols 'ra dec'" \
	   out=${outfile}

${stilts} tapskymatch \
    tapurl=https://herschel-vos.phys.sussex.ac.uk/__system__/tap/run/tap \
    taptable=herschelhelp.main \
    taplon=ra taplat=dec \
    tapcols=field,ra,dec,ebv,redshift,zspec,zspec_qual,zspec_association_flag,stellarity \
    in=${pristine} \
    inlon=ra inlat=dec \
    sr=0.00027 \
    icmd=cache \
    icmd=progress \
    find=each \
    blocksize=50000 \
    suffixremote="_help" \
    ocmd="colmeta -name zphot_hlp redshift_hlp" \
    out=${outfile}
