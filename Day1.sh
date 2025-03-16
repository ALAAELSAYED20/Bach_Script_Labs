#!/bin/bash
<<comment 1
awk -F: '
BEGIN { print "Start" }
{ print NR " Name:",  $5}
END { print "End" }' /etc/passwd
comment

<<comment 2
awk '
BEGIN { FS=":"; print "Start" } 
{
    print NR ":", $1, $5, $6
} 
END { print "End" }' /etc/passwd
comment
<<comment 3
awk '
BEGIN { FS=":"; print "Start" } 

{   if($3>500){
    print NR ":", $1,$3, "Name :",$5
    }
} 
END { print "End" }' /etc/passwd
comment
<<comment 4
awk '
BEGIN { FS=":"; print "Start" } 

{   if($3==500){
    print NR ":", $1,$3, "Name :",$5
    }
} 
END { print "End" }' /etc/passwd

comment
<<comment 5
awk  '
BEGIN{FS=":";print "Start"} 
{
    if(NR>=5 &&NR <=15){
        print NR,$0
    }
} 
END{print "End"}' /etc/passwd


comment
<<comment 6
awk -F: '
BEGIN { print "Start" }
{
  gsub(/\blp\b/, "mylp")  
  print $0
}
END { print "End" }' /etc/passwd

comment
<<comment 7
awk  '
BEGIN{FS=":"; max=0;line="";print "Start"} 
{
  if ($3 > max){
    max=$3
    line=$0
  }
} 
END{print line,"End"}' /etc/passwd

comment

<<comment 8
awk -F":" '
BEGIN { sum = 0 } 
{ sum += $3 } 
END { print "Sum :", sum }' /etc/passwd
comment