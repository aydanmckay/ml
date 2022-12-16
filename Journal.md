# Daily Journal

## 12/15/22

#### Meeting w/ Seb
Went through some ideas on moving forward with filtering the catalogue. Deadline for this step of the project to be done and going through a network by $\bf{January 15^{th}}$. Want to do a similar thing to Felipe on the removing binaries from LAMOST.

#### Created the Journal

#### Ran APOGEE x BP/RP through MLP with both Power and MinMax Scaling.
I previously determined the scalers are not the resultant of the scatter in the generated photometric magnitudes in the Pristine band. The plots of the loss through training and generated magnitudes are given through these addresses on CANFAR: ~/torchresplots/semiloglossplot_cleanapogeelossL1MLP_MinMaxbl256lr1e-2SGDep15dropout.png, ~/torchresplots/semiloglossplot_cleanapogeelossL1MLP_Powerbl256lr1e-2SGDep15dropout.png, ~/torchresplots/magplots_cleanapogeelossL1MLP_MinMaxbl256lr1e-2SGDep15dropout.png, ~/torchresplots/magplots_cleanapogeelossL1MLP_Powerbl256lr1e-2SGDep15dropout.png

#### LAMOST Cleaning:
A weird feature was shown to exist around $log\ g$ 4-5 dex and $T_{eff}$ 8000-9000 K, but was gone from the Kiel diagram of the LRS catalogue when making sure that the error on $[\alpha /M]$ was positive. The preliminary catalogue for the low-res spectra from LAMOST was reduced and the table along with the Jupyter notebook was put into the `/calsurvey` folder.
