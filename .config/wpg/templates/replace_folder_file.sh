#!/usr/bin/env bash
#	default color: 178984
oldglyph=#47938b
newglyph=#9a8b56

#	Front
#	default color: 36d7b7
oldfront=#69dace
newfront=#e2cc7e

#	Back
#	default color: 1ba39c
oldback=#51a89f
newback=#ae9d61

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
