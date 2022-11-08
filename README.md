# ml
## Photometry-Based Stellar Metallicity Estimation

Files currently in use or of note:

/ml/ColumnAVG.ipynb
/ml/concat-paramp.ipynb
/ml/torchnn/prepdatadr3proper.ipynb
/ml/torchnn/prepinputcat (effectively the same as the one above but for the huge catalogue)
/ml/torchnn/trainedmodel.ipynb
/ml/torchnn/network.ipynb

The proper order of how these files are used starts with first running /ml/concat-paramp.ipynb. This file contains a lot of bash shells that run scripts from /ml/xmatch-aydan/ that perform the crossmatching through STILTS, a version of TOPCAT for command line. This file finishes with performing the huge xmatch with all of the Gaia DR3 data and then performing the concatenation of all the tables into one large spectroscopic table matched with Gaia DR3 XP coefficients.

Next, /ml/ColumnAVG.ipynb is used to collapse all the spectroscopic values into one averaged column, independent of the origin catalogue. This is done very simply as of now, and need a more robust alorithm in the future.

After, either /ml/torchnn/prep*.ipynb can be run, as they both do the same thing but for different input tables. All these files are meant for is a simple cut in the data according to the uncertainty of the XP coefficient labels, and then converting the .fits file to a .h5 format, which works better for the Dataset class in /ml/torchnn/network.ipynb.

Finally, /ml/torchnn/network.ipynb can be run, which is responsible for training the algorithm. This file contains the scaling of the data, the NN model class, the Dataset class, and the comparison plots at the end of the training. These comparison plots are created using the GaiaXPy package.

The quirks of the /ml/torchnn/network.ipynb file are worked out in the /ml/torchnn/trainedmodel.ipynb notebook. This notebook consists of two separate sections, the first of which was concerned with making sure the data was manipulated into the correct format for the synthetic magnitude generation at the end of the network.ipynb notebook. The second portion of the file dealt with cleaning the data as there was a very large scatter when generating the synthetic magnitude from the predicted BP/RP coefficients. At the end of the cleaning of the data, some code from the /ml/torchnn/prep*.ipynb notebooks was borrowed to create the clean dataset.