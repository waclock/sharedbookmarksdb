source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.1'

#Herramientas de desarrollo
group :development, :test do
  gem 'progress_bar' #para mostrar una progressbar en la consola en procesos largos
  gem 'rack-mini-profiler' #para mostrar estadísticas de velocidad y queries en las vistas
  gem "rails-erd" #para generar diagramas E-R de la base de datos. Uso: rake erd
  gem "rename" #para cambiarle el nombre(y la carpeta) a la app con: rails g rename:app_to DefaultInit
  gem 'hirb' #mejora como se muestran las respuestas de tablas de rails c. Uso: Hirb.enable
  gem "quiet_assets", ">= 1.0.2" #para no mostrar cuando se cargan las assets en el log
  gem "hub", ">= 1.10.2", :require => nil #agrega funcionalidades extra de GitHub en la consola
  #en test rails 4
  # gem "better_errors", ">= 0.7.2" #para mejorar cómo se ven los errores cuando se cae
  # gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx] #para poder hacer consultas en el entorno de errores
end

#Para el manejor de assets
gem 'actionpack',   '>= 4.0.1'
gem 'sass-rails',   '>= 4.0.0'
gem 'coffee-rails', '>= 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem "font-awesome-rails" #para usar iconos de bootstrap extendidos
# gem "bootstrap-sass", ">= 2.3.2.1"
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', #librería de css y js Twitter Bootstrap 3
                              :git => 'https://github.com/anjlab/bootstrap-rails.git',
                              :branch => '3.0.0'
gem 'jquery-rails' #jquery en los assets de rails

#Herramientas de Rails
gem "thin" #servidor bueno para consultas ajax y buena combinacion con unicorn para multithread
gem "bcrypt-ruby", '~> 3.1.2', :require => "bcrypt"	#para encriptar contraseñas y tokes
gem "kaminari" #paginador que hace bien la pega
gem "haml-rails", ">= 0.4" #para usar vistas .haml
gem "sendgrid", ">= 1.0.1" 
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"
gem "figaro", ">= 0.6.3" #para declarar variables de entorno(en el application.yml). Se suben a heroku con: rake figaro:heroku

#HErramientas de testing
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "capybara", ">= 2.0.3", :group => :test
gem "database_cleaner", ">= 1.0.0.RC1", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]

#subir archivos usando AmazonS3
gem 'cocaine', "~> 0.5.3"
gem "paperclip", :git => "https://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk'

#Heroku services & configurations
#cambio de BBDD para heroku
group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
gem "unicorn", ">= 4.3.1" #servidor con multithread en producion
gem 'newrelic_rpm'
gem 'rollbar'

#gem 'delayed_job_active_record'
gem 'rails_12factor', group: :production #compatibilidad con rails 4
# gem 'protected_attributes'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



