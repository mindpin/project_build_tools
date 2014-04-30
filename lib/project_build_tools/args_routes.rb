module ProjectBuildTools
  class ArgsRoutes
    def initialize(args)
      @args = args
    end

    def run
      case @args[0]
      when 'sinatra'
        ProjectBuildTools::Sinatra.new(@args).run
      else
        puts "说明(TODO)"
      end
    end
  end
end