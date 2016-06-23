set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'performance.eps'

# Each bar is half the (visual) width of its x-range.
set boxwidth 0.05 absolute
set style fill solid 1.0 noborder

bin_width = 0.1;

bin_number(x) = floor(x / bin_width)

rounded(x) = bin_width * ( bin_number(x) + 0.5 )

plot 'performance.txt' using (rounded($1)):(1) title '' smooth frequency with boxes
