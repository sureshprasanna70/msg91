module Msg91
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_initializer
        template "msg91_initializer.rb", "config/initializers/msg91.rb"

        puts "Install complete! Truly Outrageous!"
      end
    end
  end
end
