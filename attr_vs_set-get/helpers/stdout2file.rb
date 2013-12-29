def logfile(filename="benchmark.log")
  $stdout = File.open(filename, 'w')
  $stdout.sync = true
end
