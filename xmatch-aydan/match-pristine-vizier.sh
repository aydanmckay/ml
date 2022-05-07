#!/bin/bash

presort=true 
workdir=/arc/projects/k-pop/pristine/

pushd ${workdir}

# match with GALEX
stilts cdsskymatch \
    in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
    ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='GALEX GR6+7 AIS' \
	radius=2 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_galex_gr67.fits

# match with CatWISE
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='CatWise2020' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_catwise_2020.fits

# match with 2MASS
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='2MASS' \
	radius=2 \
	find=each \
	blocksize=500000 \
    ocmd="delcols '2MASS X_cds MeasureJD'" \
    out=/arc/home/aydanmckay/xmatch/pristine_2mass.fits

# match with 2MASS6X
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='2MASS6X' \
	radius=2 \
	find=each \
	blocksize=500000 \
    ocmd="delcols '2MASS errHalfMaj errHalfMin errPosAng X_cds MeasureJD'" \
    out=/arc/home/aydanmckay/xmatch/pristine_2mass6x.fits

# match with APASS
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='APASS DR9' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_apass_dr9.fits

# match with GSC
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='GSC 2.4.2' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_gsc_2.4.2.fits

# match with CMC
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='CMC15' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_cmc_15.fits

# match with IGAPS
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='IGAPS DR1' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_igaps_dr1.fits

# match with GAIA
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='Gaia EDR3 J2016' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_gaia_edr3.fits

# match with SDSS photometry (DR17 = DR16 =...= DR12)
stilts cdsskymatch \
	in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
	ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='SDSS DR16' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/xmatch/pristine_sdss_photobj_dr17.fits
