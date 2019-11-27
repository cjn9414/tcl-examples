set max_size 10000
set min_size 100
set dir_path pseudo-data

puts "Please enter a dataset size"

gets stdin user_size

set curr_size 10

if {$user_size > $max_size} {
	puts "Restricting maximum dataset size to $max_size"
	set user_size $max_size
} elseif {$user_size < $min_size} {
	puts "Restricting minimum dataset size to $min_size"
	set user_size $min_size
}

if {[file exist $dir_path]} {
    if {![file isdirectory $dir_path]} {
      puts "$dir_path exists, but it's a file"
			file mkdir $dir_path
    }
} else {
  file mkdir $dir_path
}

catch { cd $dir_path }

set infile [open data.txt w]

for {set line 0} {$line < $user_size} {incr line} {
	puts $infile [ expr {round(rand()*1000)} ]
}

close $infile

