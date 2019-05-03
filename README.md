Introduces a few internal file name conventions:

.eod	   - Legacy Hopkins Lab Binary EOD Formatted File (Updated to Version 2).  Multiple Recordings per EOD.  Space Efficient.
.mat	   - Matlab formatted recording of EOD.  Multiple Recordings Per EOD inside the 'eod' structure.
.leod.mat  - long recording of EOD.  One recording per file.


To open a .leod file:

eod=load('Desktop\TEST2019\mytest.leod.mat')

