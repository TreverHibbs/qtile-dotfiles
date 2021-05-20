#!/usr/bin/env bash
#	default color: 178984
oldglyph=#8a6d4f
newglyph=#8a6d4f

#	Front
#	default color: 36d7b7
oldfront=#cda174
newfront=#cda174

#	Back
#	default color: 1ba39c
oldback=#9e7c5a
newback=#9e7c5a

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
