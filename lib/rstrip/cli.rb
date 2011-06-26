require 'thor'
require 'rstrip/rstrip'
module Rstrip
  class CLI < Thor

    include Thor::Actions

    desc "config", "generate: to generate a .rstrip file. show: to show the files that will be operated on"
    long_desc <<-D
      config can receive two arguments.

      generate: Generate a .rstrip config file containing file extensions rstrip will operate on.Defaults to the current
                directory.Use --global true to generate .rstrip to the user's home directory.\n
      show:     Show the location of the .rstrip config file that will be used. And show a list of files that will be
                operated on based on the .rstrip config file
    D
    method_option :global, :type => :boolean, :aliases => "-g", :default => false
    def config(task)
      case task.downcase
      when 'generate'
        if options[:global]
          template("rstrip.tt.txt", "#{Dir.home}/.rstrip")
        else
          template("rstrip.tt.txt", "#{Dir.pwd}/.rstrip")
        end
      when 'show'
        Rstrip.show
      end
    end

    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

  end
end