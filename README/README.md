  # <McCollum_Schoenecker_ENV872_EDA_FinalProject>

<General notes: add as much information as is relevant for your repository. Some overarching guidelines are provided, but feel free to expand on these guidelines.>
<More resources found here: https://www.dataone.org/all-best-practices>
<Delete the text inside the brackets when formatting your file.>

## Summary

<describe the purpose of this repository, the information it contains, and any relevant analysis goals. What, why, where, when, how?>

This repository holds all the information for our final Environmental Data Analytics project (ENVIRON 872- Spring 2022). It's purpose is to illustrate our competency in analyzing an environmental dataset using R and Rstudio. The dataset contains information from eBird, an open-source citizen science project.

##### Project question
  The main question we seek to answer through the following analyses is Has the bird population of the Research Triangle increased in species richness over the past decade? To further understand whatever changes occur over this time period in the Research Triangle, we also ask: Has that change been consistent across all three main counties in the area? Was there a clear trend in the presence of species of concern across the decade? How did the popularity of eBird change in the RT over the 2010s? 
  
##### Analyses
  We utilized time series analyses to answer our research question including a time series of species totals for each of these counties: Durham, Orange, Wake and a time series of observer totals for each of the three counties. We also visualized Species of Greatest Conservation Need spp totals from 2010-2019 by county to support our findings. 
  
## Investigators
<name(s), affiliation(s), contact information, roles (if applicable)>

Aurora McCollum, Master of Environmental Management candidate, Coastal Environmental Management, aurora.mccollum@duke.edu 

Rachel Schoenecker, Master of Environmental Management candidtate, Ecosystem Science and Conservation, rachel.schoenecker@duke.edu

## Keywords
<add relevant keywords here>

Research Triangle, avian population diversity, time series analysis, ebird, citizen science, open-source data 

## Database Information

<describe the origin of all data in the repository, including data collected from outside sources and new data generated by the investigator(s). If data was accessed from an outside database, the date(s) of data access should also be included.>

All the data included in this project came from the eBird website (eBird 2022). We filtered by county and January 2010-December 2091. It was downloaded on April 8, 2022. 

## Folder structure, file formats, and naming conventions 

<describe the folders contained in the repository, including what type of files they contain>

There is a "Code" folder, which contains preliminary data wrangling, our basic analyses, and some test markdowns. The "Data" folder contains two subfolders, "Processed" and "Raw". The Raw folder has the data as it was downloaded from eBird, some of the data has been zipped due to the large size. The Processed folder has the tidy data after we removed unnecessary columns. The "Output" folder contains our plots and time series decompositions. Finally, the "README" folder contains this file! 

<describe the formats of files for the various purposes contained in the repository>

Code files are rmarkdowns, Data files are mostly in .csv or .zip format, and Output files are .png. 

<describe your file naming conventions>

We used descriptive names, but did not follow one specific naming convention. The for data and output the title includes the county when relevant and some other descriptor reminding us what the output will be (related to analyses). 


## Scripts and code

<list any software scripts/code contained in the repository and a description of their purpose.>



## Quality assurance/quality control


<describe any relevant QA/QC procedures taken with your data. Some ideas can be found here:>
<https://www.dataone.org/best-practices/develop-quality-assurance-and-quality-control-plan>
<https://www.dataone.org/best-practices/ensure-basic-quality-control>
<https://www.dataone.org/best-practices/communicate-data-quality>
<https://www.dataone.org/best-practices/identify-outliers>
<https://www.dataone.org/best-practices/identify-values-are-estimated>