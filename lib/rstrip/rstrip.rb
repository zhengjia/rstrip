module Rstrip

  class Rstrip

    class << self

      def process(line)
        line.rstrip + "\n"
      end

      def show
        if File.exists?("#{Dir.pwd}/.rstrip")
          path = "#{Dir.pwd}/.rstrip"
          puts "Using #{Dir.pwd}/.rstrip in the current directory"
        elsif File.exists?("~/.rstrip")
          path ="#{Dir.home}/.rstrip"
          puts "Using #{Dir.home}/.rstrip in your home directory"
        else
          puts %{ Can't find any .rstrip config file\n
                  Please run 'rstrip config generate'\n
               }
          exit
        end
        extensions = get_extensions(path)
        files = get_files(extensions)
      end

    private

      def get_extensions(path)
        extensions = []
        file = File.open(path, "r")
        file.each_line do |line|
          line.strip!
          unless line.empty?
            if line.start_with?(".")
              line = line[1..-1]
            end
            extensions << line
          end
        end
        puts "Using the following extensions:\n #{extensions.join(', ') }\n"
        extensions
      end

      def get_files(extensions)
        pattern = "**/*.{#{extensions.join(",")}}"
        files = Dir.glob(pattern)
        puts "Files that will be operated on:"
        files.collect{|f| puts f}
        files
      end

    end # end class method

  end

end