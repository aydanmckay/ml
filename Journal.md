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
