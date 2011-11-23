require 'active_support/inflector'

guard 'rspec', :version => 2, :cli => '-fd' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }

  # Library files
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }

  # FactoryGirl Factories
  watch(%r{^spec/factories/(.+)\.rb$})                { |m| [ "spec/models/#{m[1].singularize}_spec.rb", "spec/controllers/#{m[1]}_controller_spec.rb" ] }

  # Rails
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| ["spec/requests/#{m[1]}_spec.rb", "spec/acceptance"] }
  watch(%r{^app/views/devise/(.+)/.*\.(erb|haml)$})   { |m| ["spec/requests/#{m[1]}_spec.rb", "spec/acceptance"] }
  watch(%r{^app/views/layouts/(.+)/.*\.(erb|haml)$})  { |m| ["spec/requests/#{m[1]}_spec.rb", "spec/acceptance"] }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance"] }
  watch('config/routes.rb')                           { "spec/acceptance" }
  watch('app/controllers/application_controller.rb')  { ["spec/controllers", "spec/acceptance"] }
end
