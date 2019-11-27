source source_input_output.tcl

catch { cd $dir_path }

if { ![file exists data.txt] } {
	puts "Data file does not exist!"
	exit 1
}

set datafile [open data.txt r]
set total_entries 0
set entry_sum 0

while { [gets $datafile line] >= 0 } {
	incr total_entries
	incr entry_sum $line
}

close $datafile

puts "Total number of entries: $total_entries"
puts "Average entry value: [expr round($entry_sum / $total_entries)]"
