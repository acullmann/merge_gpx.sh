#!/bin/bash

# acullmann 2016-09-19
#
# merge indefinitly much gpx files using gpsbabel.
#

# setting all but the last parameter as source
length=$(($#-1))
SOURCE=${@:1:$length}


# setting the last parameter as target
TARGET=${!#} 

if [ -f "${TARGET}" ]
then
	echo "Target ${TARGET} already exist. Aborting"
	exit -1
fi


# adding the -f for gpsbabel to each file
for i in $SOURCE ;
do
	SOURCE_F="${SOURCE_F} -f ${i} ";
done 


gpsbabel -i gpx ${SOURCE_F} -o gpx -F ${TARGET}

