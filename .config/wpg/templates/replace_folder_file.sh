#!/usr/bin/env bash
#	default color: 178984
oldglyph=#32898d
newglyph=#47938b

#	Front
#	default color: 36d7b7
oldfront=#4bced5
newfront=#69dace

#	Back
#	default color: 1ba39c
oldback=#3a9fa4
newback=#51a89f

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
