set terminal pngcairo size 800,600 enhanced font "Roboto Condensed,11"
set output "selvin-reg.png"

unset colorbox

set palette defined (0 "#6495ed", 1 "#ff8c00")
set yrange [6:9.9]
set xrange [23:36]
set ylabel "Birth weight"
set xlabel "Maternal age"
set key inside noautotitle right bottom reverse Left

plot("selvin-reg.txt") with points pt 7 palette, \
  keyentry with points pt 7 palette cb 0 title "Non smoker", \
  keyentry with points pt 7 palette cb 1 title "Smoker"

