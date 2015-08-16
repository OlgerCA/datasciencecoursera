
# Getting and Cleaning Data Course Project

## Introduction

The purpose of this repository is to share a R script named "run_analysis.R" that can be used to transform a raw data set into a tidy data set. These two sets are described as follows:

* Raw data set: It's a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. For more information please visit this [page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) .
* Tidy data set: This data set summarizes a lot of the information contained in the raw data set, giving as a result a more compact form of the data that could be used for later analysis. This data set contains one observation for every subject/activity pair (please read the raw data description at the provided link) and gives average values for certain variables. These variables are a subset of the original "features" variables of the raw set. Please read the provided Code Book.

## Prerequisites

1. Having R computing environment installed. The script was tested using the 3.2.1 version of R, but could work on previous versions as well.
2. Having "dplyr" package installed. The following version was used for the analysis: 0.4.2.
3. Having in your working directory the raw data set. This should a folder named "UCI HAR Dataset" with all the necessary files. A compressed file with the raw data can be downloaded at the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Running the script

There is only one script included in this repository (run_analysis.R). After being executed, a new file in the working directory should be created (tidy_data_set.txt), which contains the tidy data described above. No others steps are involved in this process. For an explanation of how the script works, please see the comments included in the source code itself.

## Loading the tidy data set

The created tidy data set can be loaded into R using the read.table command with row.names =  FALSE.