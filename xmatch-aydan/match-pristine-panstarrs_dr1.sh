#!/bin/bash

presort=true

# match with GALEX
stilts cdsskymatch \
    in=/arc/projects/k-pop/pristine/Pristine_CaHK.fits \
    icmd="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag'; colmeta -name CaHK CaHK_0" \
    ra='RA(CaHK)' dec='Dec(CaHK)' \
	cdstable='PanSTARRS DR1' \
	radius=1 \
	find=each \
	blocksize=500000 \
	out=/arc/home/aydanmckay/tables/pristine_panstarrs_dr1.fits