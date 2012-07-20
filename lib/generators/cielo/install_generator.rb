module Cieloloja
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "Cria o initializer da cieloloja na app rails"
      
      def copy_initializer
        template "cieloloja.rb", "config/initializers/cieloloja.rb"
      end
      
    end
  end
end