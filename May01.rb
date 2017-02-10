## May's diffference equation
require 'yaml'

def yaml_save object, fileout  # Save results to a file
  File.open fileout, 'w' do |f|
    f.write(object.to_yaml)
  end
end

r = 2.8
x = 0.6
gen = 20
array = []

(1..gen).each do |n|
  y = r * x * (1-x)
  array << y
  x = y
end

(1..gen).each do |n|
  #puts "Gen #{n}, Size #{array[n-1]}"
  puts array[n-1]
end

# Write to Results file
fileout = 'pops.R'
dataset = "y <- c(#{array})
x <- c(1:20)
plot(x, y)
abline(h=mean(y))"   # introduces unwanted characters and sqaure brackets for the array
yaml_save dataset, fileout
`mv pops.R ..`  # moves file so R studio can access it

