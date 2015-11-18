#!/bin/sh
TIME=`date +"%Y_%m_%d_%p_%I_%M_%S"`

if [[ $1 == "-b" ]]
then
  platex "$2.tex"
  pbibtex "$2"
  platex "$2.tex"
  platex "$2.tex"
  dvipdfmx "$2.dvi"
  open "$2.pdf"
  echo "display notification \"@$TIME\" with title \"FINISHED LaTex\" subtitle \"LaTexName:$2\" " | osascript
elif [[ $1 == "-h" ]]
then
  echo "usage: tx [add_parameters] [filename]
    [parameters]
       tx -n [filename]
       tx -l [filename]
       tx -b [filename]
       -n : n
       -l : l
       -b : bibtex"
else
  platex "$1.tex"
  dvipdfmx "$1.dvi"
  open "$1.pdf"
  echo "display notification \"@$TIME\" with title \"FINISHED LaTex\" subtitle \"LaTexName:$1\" " | osascript
fi