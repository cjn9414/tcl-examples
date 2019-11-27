set max_size 10000
set dir_path pseudo-data

puts "Please enter a dataset size"

gets stdin user_max_size

set curr_size 10

if {$user_max_size > $max_size} {
	puts "Restricting maximum dataset size to $max_size"
	set $user_max_size $max_size
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

for {set line 0} {$line < $user_max_size} {incr line} {
	puts $infile [ expr {round(rand()*1000)} ]
}
