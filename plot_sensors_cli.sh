#!/bin/bash

gnuplot <<EOF
set terminal dumb 120 30
set datafile separator ","
set xdata time
set timefmt "%s"
set format x "%H:%M"
set xrange [*:*]
set yrange [*:*]
set title "Core 0 Temperature (ASCII Graph)"
set xlabel "Time"
set ylabel "°C"
plot "sensor_log.csv" using 1:2 with lines title "Core 0"
EOF
