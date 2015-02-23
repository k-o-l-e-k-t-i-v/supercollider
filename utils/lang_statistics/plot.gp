#!/usr/bin/gnuplot
reset
set terminal pngcairo size 1024,480 enhanced font 'Monaco,7'
set output 'code_usage.png'

#set style histogram cluster
set style fill solid 1.0

set title "SuperCollider code statistics" textcolor rgb "white"
set xlabel "popular Classes" textcolor rgb "white"
set ylabel "total use count" textcolor rgb "white"
set xtics textcolor rgb "white"
set ytics textcolor rgb "white"
set label textcolor rgb "white"
set key textcolor rgb "white"
set border lw 1 lc rgb "#444444"

#set autoscale fix
set auto x

set style data histogram
set style fill solid border -1
set boxwidth 0.75
set xtic rotate by -90 scale 0
set bmargin 7

set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb "#000000" behind

plot "data.csv"\
using 2 lt rgb "#6600CC" t "Alex",\
'' using 3 lt rgb "#FFCC00" t "Jáchym",\
'' using 4:xtic(1) lt rgb "#CC0000" t "Kryštof"
