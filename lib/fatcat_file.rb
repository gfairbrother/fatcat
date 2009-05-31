def load_file(fileloc)
  if fileloc == nil
    puts "No file specified"
    exit
  end

  # log_contents will eventually hold all of our processed log file
  log_contents = []
  
  file = File.new(fileloc, 'r')
  while (paragraph = file.gets(nil)) # nil gets a whole paragraph (two successive newlines)

    # create a new LogEntry object which will hold all the data we extract from the log entry
    log_entry = Fatcat::LogEntry.new(paragraph)
  
    #split the paragraph into lines
    lines = paragraph.split(/\n/)
    
    # if the paragraph only has one line then it may be an error
    # or a misc one liner like rubyamf
    if lines.size == 1
      # lets see if it's an error
      if lines[0] =~ /error/
        log_entry.error = true
      end
    end

    # paragraph.gets.each do |line|
    # 
    #   if line[0,10] == 'Processing '
    #     # Processing UserDataStoresController#show (for 124.171.224.217 at 2009-04-06 09:24:37) [GET]
    # 
    #   end
    # 
    # end
    
    # add this log_entry to our log_contents array
    log_contents << log_entry
  end
  # not really needed for ruby, but it's an old habbit and I like it for readability
  return log_contents
end
