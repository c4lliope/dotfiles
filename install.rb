#!/usr/bin/ruby

files = `ls source`.split

files.each do |file|
  print "Linking #{file}...\t"
  `ln -s \`pwd\`/source/#{file} ~/.#{file}`
  puts "Done"
end
