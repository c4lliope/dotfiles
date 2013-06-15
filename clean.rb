#!/usr/bin/ruby

files = `ls source`.split

files.each do |file|
  print "Removing link to #{file}...\t"
  `rm ~/.#{file}`
  puts "Done"
end
