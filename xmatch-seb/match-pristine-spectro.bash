#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"

dir=/arc/projects/k-pop/pristine/xmatch
in1=/arc/projects/k-pop/pristine/Pristine_CaHK.fits

########################
function outfile() {
    base1=$(basename ${in1})
    base1=${base1%.*}
    base2=$(basename ${in2})
    base2=${base2%.*}
    echo ${dir}/${base1}.${base2}.fits
}

in2=/arc/projects/k-pop/catalogues/sdss-apogee-dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='RA DEC' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/sdss-mastar-dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='RA DEC' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/sdss-sspp-dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='PLUG_RA PLUG_DEC' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/sdss-specobj-dr17.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='PLUG_RA PLUG_DEC' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/lamost-lrs-dr7v2.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='ra_obs dec_obs' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)
       
in2=/arc/projects/k-pop/catalogues/lamost-mrs-dr7v2.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='ra_obs dec_obs' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)
       
in2=/arc/projects/k-pop/catalogues/lamost-dr8-gaiaedr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='ra_obs dec_obs' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/lamost-dr8-gaiaedr3.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='ra_obs dec_obs' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)
       
in2=/arc/projects/k-pop/catalogues/galah-dr3v2.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='ra_dr2 dec_dr2' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)

in2=/arc/projects/k-pop/catalogues/milliquas.fits

${stilts} tmatch2 \
       in1=${in1} \
       values1='RA(CaHK) Dec(CaHK)' \
       in2=${in2} \
       values2='RA DEC' \
       matcher=sky \
       params=1.5 \
       join=all1 \
       out=$(outfile)
