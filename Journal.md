# Daily Journal

## 15/12/22

#### Meeting w/ Seb
Went through some ideas on moving forward with filtering the catalogue. Deadline for this step of the project to be done and going through a network by $\bf{January 15^{th}}$. Want to do a similar thing to Felipe on the removing binaries from LAMOST.

#### Created the Journal

#### Ran APOGEE x BP/RP through MLP with both Power and MinMax Scaling.
I previously determined the scalers are not the resultant of the scatter in the generated photometric magnitudes in the Pristine band. The plots of the loss through training and generated magnitudes are given through these addresses on CANFAR: ~/torchresplots/semiloglossplot_cleanapogeelossL1MLP_MinMaxbl256lr1e-2SGDep15dropout.png, ~/torchresplots/semiloglossplot_cleanapogeelossL1MLP_Powerbl256lr1e-2SGDep15dropout.png, ~/torchresplots/magplots_cleanapogeelossL1MLP_MinMaxbl256lr1e-2SGDep15dropout.png, ~/torchresplots/magplots_cleanapogeelossL1MLP_Powerbl256lr1e-2SGDep15dropout.png

#### LAMOST Cleaning:
A weird feature was shown to exist around $log\ g$ 4-5 dex and $T_{eff}$ 8000-9000 K, but was gone from the Kiel diagram of the LRS catalogue when making sure that the error on $[\alpha /M]$ was positive. The preliminary catalogue for the low-res spectra from LAMOST was reduced and the table along with the Jupyter notebook was put into the `/calsurvey` folder.

## 06/01/23

#### LAMOST Cleaning:
Decided to avoid including the M dwarfs and giants catalogue because as seen in the notebook, there is a huge amount of streaking in the data or some area where the pipeline that was used by LAMOST decided to assign values to the nearest 100 K or .1 dex. Beyond that, the medium resolution catalogue was cleaned the same way the lrs catalogue was and appended to the filtered table to create the full catalogue of spectroscopic parameters from LAMOST.

## 09/01/23

##### SEGUE Cleaning:
Next on the docket is SEGUE.

## 10/01/23

#### Meeting
The LAMOST data is looking alright, what is needed to do still is to match to a variable and a binary star catalogue, but to do so I can just use the notebook already created by Felipe.

The SEGUE data is interesting. The alpha abundances were calculated using only one type of estimator called NGS2, where the recommended SSPP $[T_{eff}]$, $[log \g]$, and $[Fe /H]$ are the adopted parameters from the best estimation from multiple estimators. Instead, I will use NGS1 for $[T_{eff}]$ (There is no NGS@ for $[T_{eff}]$????) and NGS2 for the other 3 parameters. I will use the adopted rv parameters as there weren't many estimators and they'll just be the best ones to use.

So once we have this large dataset, what do we do next? We need to set some measurements as the reference measurements for a boosting algorithm to determine the corrections to. These can either be to the Gaia RVS data or the benchmark stars. There are only about 20-40 benchmark stars, so we'll probably rely on the RVS data. Then we use a boosting algorithm to learning the calibrations of all the other catalogues to RVS. This algorithm will use origin as a parameter, and then determine the calibration for each of the datasets. Then, those sources without a Gaia RVS match (gaia_source_id match), we'll run through the algorithm after training with all those that do have a match being the train/valid/test set.