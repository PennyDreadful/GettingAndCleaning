Data Analysis
=============

All of the work is performed by the script `run_analysis.R` and the
majority of the script is devoted to reading, annotating and combining
the raw datasets. This work is described in Codebook.md.

Data Tidying
============

The remaining work performed by `run_analysis.R` is to group the data by
Activity and by Subject and compute the means for the data entries for
each Activity, Subject pair. Finally, the Activity Id column is
discarded (since it has a 1 to 1 correspondance with Activity and is
therefore redundant) and the data is written to `tidy.txt`.
