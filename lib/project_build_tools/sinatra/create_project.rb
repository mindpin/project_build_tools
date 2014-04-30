require 'fileutils'
module ProjectBuildTools
  class Sinatra
    class CreateProject
      def initialize(project_name)
        @project_name = project_name
        @ProjectName = _camelize(@project_name)
      end

      def run
        puts "ready to create sinatra project: #{@project_name}"
        
        project_dir = File.join(Dir.pwd, @project_name)
        if File.exists?(project_dir)
          p "directory: #{project_dir} already exists"
          return
        end
        _create_project(project_dir)
        puts "create success!!!"
      end

      def _create_project(project_dir)
        FileUtils.mkdir(project_dir)

        template_dir = File.expand_path("../../../../templates/sinatra", __FILE__)
        FileUtils.cp_r(File.join(template_dir, "."), project_dir)

        _replace_placeholder(project_dir)
      end

      def _replace_placeholder(project_dir)
        # config/deploy.rb
        _replace_placeholder_of_file(
          File.join(project_dir, "config/deploy.rb")
        )
        # lib/app.rb
        _replace_placeholder_of_file(
          File.join(project_dir, "lib/app.rb")
        )
        # spec/spec_helper.rb
        _replace_placeholder_of_file(
          File.join(project_dir, "spec/spec_helper.rb")
        )
        # templates/layout.haml
        _replace_placeholder_of_file(
          File.join(project_dir, "templates/layout.haml")
        )
        # config.ru
        _replace_placeholder_of_file(
          File.join(project_dir, "config.ru")
        )
        # Rakefile
        _replace_placeholder_of_file(
          File.join(project_dir, "Rakefile")
        )
      end

      def _replace_placeholder_of_file(file_path)
        str = IO.read(file_path)
        str = str.gsub('!{ProjectName}', @ProjectName)
        str = str.gsub('!{project_name}', @project_name)
        IO.write(file_path, str)
      end

      def _camelize(str)
        str.split(/-|_/).map(&:capitalize)*""
      end
    end
  end
end