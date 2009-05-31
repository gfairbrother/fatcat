module Fatcat
  class LogEntry
    attr_accessor :duration, :time, :controller, :url, :params, :complete_entry, :error
    
    def initialize(complete_entry)
        @duration = nil
        @time = nil
        @controller = nil
        @url = nil
        @params = nil
        @complete_entry = complete_entry
        @error = false
    end
  end
end