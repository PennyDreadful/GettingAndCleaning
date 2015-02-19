Reading Data
============

The dataset has been split into two sets: training and test. As such
`run_analysis.R` first reads three files each for the training and test
sets. The first file is the raw measurement data (`X_train.txt`), the
second iss a list of all the activity ids (`y_train.txt`) and the third
is a list of the subject ids (`subject_train.txt`), with three analogous
files for `test`. Finally the script loads in the descriptions of the
measurement data (`features.txt`) and the activity labels corresponding
to the ids (`activity_labels.txt`).

Having loaded the sets of training and test data, the three types of
data are combined in three files.

Labelling and merging
=====================

Column labels are provided next, with `features.txt` providing the
column labels for the raw data. Next the three datasets are merged into
one. Some of the columns prove to have identical labels, so it was
necessary to remove them before continuing with the analysis.

Final cleaning
==============

The last step is to discard unwanted data, and so the script discards
every column except those describing the activity, labelling the subject
or storing mean or standard deviations of the raw data.
