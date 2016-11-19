require "rubygems"
require "ap"
require "fileutils"

def cd(dir)
  FileUtils.cd(dir)
end

def pwd
  FileUtils.pwd
end
