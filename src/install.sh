#!/bin/bash

echo 'Register haxe-ga with haxelib'
haxelib dev haxe-ga `pwd`

if [ $? -eq 0 ]; then
  echo '[OK]'
else
  echo '[ERROR]'
fi

