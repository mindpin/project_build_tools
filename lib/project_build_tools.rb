require "project_build_tools/version"
require 'project_build_tools/args_routes'
require 'project_build_tools/sinatra'
require 'project_build_tools/sinatra/create_project'

module ProjectBuildTools
  def self.run(args)
    ProjectBuildTools::ArgsRoutes.new(args).run
  end
end
