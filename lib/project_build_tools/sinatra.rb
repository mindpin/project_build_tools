module ProjectBuildTools
  class Sinatra
    def initialize(args)
      @args = args
      @project_name = @args[1]
    end

    def run
      ProjectBuildTools::Sinatra::CreateProject.new(@project_name).run
    end
  end
end