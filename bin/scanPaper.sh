#!/bin/sh

# Usage scanPaper /output/path/forScan
# Scan an '11-8.5' paper and convert to pdf
# Place pdf in /output/path/forScan
# Does not remove /tmp/scan by default, uncomment last
# line to remove temporary file afterwards


scanimage --mode Binary --resolution 600 -x 215.9 -y 279.4 > /tmp/scan.ppm
ppm2tiff /tmp/scan.ppm /tmp/scan.tiff
tiff2pdf /tmp/scan.tiff > /tmp/scan.pdf
md5=$(md5sum /tmp/scan.pdf | cut -d ' ' -f 1)
date_stamp=$(date "+%Y_%m_%d")
mv /tmp/scan.pdf $1/${date_stamp}\ ${md5}.pdf
# rm /tmp/scan.*

