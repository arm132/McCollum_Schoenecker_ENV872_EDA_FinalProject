  # <McCollum_Schoenecker_ENV872_EDA_FinalProject>


## Summary


This repository holds all the information for our final Environmental Data Analytics project (ENVIRON 872- Spring 2022). It's purpose is to illustrate our competency in analyzing an environmental dataset using R and Rstudio. The dataset contains information from eBird, an open-source citizen science project.

##### Project question
  The main question we seek to answer through the following analyses is how the bird population of the Research Triangle has changed in species richness between 2010 and 2019. To further understand whatever changes occur over this time period in the Research Triangle, we also ask: Has that change been consistent across all three main counties in the area? Was there a clear trend in the presence of species of concern across the decade? How did the popularity of eBird change in the RT over the 2010s? 
  
##### Analyses
  We utilized time series analyses to answer our research question including a time series of species totals for each of these counties: Durham, Orange, Wake and a time series of sampling event totals for each of the three counties. We also visualized Species of Greatest Conservation Need spp totals from 2010-2019 by county to support our findings. 
  
## Investigators

Aurora McCollum, Master of Environmental Management candidate, Coastal Environmental Management, <aurora.mccollum@duke.edu>

Rachel Schoenecker, Master of Environmental Management candidtate, Ecosystem Science and Conservation, <rachel.schoenecker@duke.edu>

## Keywords

Research Triangle, bird diversity, time series, eBird, citizen science, open-source data

## Database Information

All the data for analysis included in this project came from the eBird website (eBird 2022). We filtered by county and January 2010-December 2019. It was downloaded on April 8, 2022. 
For reference, a database of Species of Greatest Conservation Need (SGCN) from the North Carolina Wildlife Resources Commission was also utilized (NCWRC 2020) and was downloaded on April 8, 2022.

## Folder structure, file formats, and naming conventions 

There is a "Code" folder, which contains preliminary data wrangling, our basic analyses, and some test markdowns. The "Data" folder contains two subfolders, "Processed" and "Raw". The Raw folder has the data as it was downloaded from eBird, some of the data has been zipped due to the large size. The Processed folder has the tidy data after we removed unnecessary columns. The "Output" folder contains our plots and time series decompositions.

Code files are rmarkdowns and general r files, Data files are mostly in .csv or .zip format, and Output files are .png. 

We used descriptive names, but did not follow one specific naming convention. For the data and output the title includes the county when relevant and some other descriptor reminding us what the output will be (related to analyses). 


## Scripts and code

In the code folder you will find the following files

**Data wrangling_time series_Mann kendall:** uploading data and wrangling, along with time series for unique birder ID's and the related mann kendall. 

**Durham Event Count Time Series:** code for unique sampling events by month and total species count and their corresponding time series analyses. 

**Geospatial EDA Code:** creating shape files for each county and creating maps that showed the amount of unique common names by latitude and longitude.

**Wrangling for Time Series:** used when we were having problems with our github and wanted to share the code we were working on

**Preliminary Data Wrangling:** This code is what we did to make the giant datasets downloaded small enough to push to github, before we did out other wrangling to make them look better. 

**Region-Wide Times Series Code:** Time series analysis done on all three counties together (instead of by county like in prelim code)

**SGCN Analysis code:** Wrangling and analyzing Species of Greatest Conservation Need data, combining with each counties dataset.

**Summary Table:** Table including descriptions of the 12 variables selected for analysis within the eBird datasets.


## Quality assurance/quality control

We did not feel there were any relevant quality assurance or quality control methods we could use with the data we had. As a citizen science dataset we recognize there is some uncertainty. This is something we took into consideration when making conclusions. 

