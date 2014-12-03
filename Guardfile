
guard 'livereload' do
  watch(%r{app/controllers/.*\.rb})
  watch(%r{config/routes.rb})

  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

# guard :rubocop, cli: ['-D'] do
#   # Rails example
#   watch(%r{^app/(.+)\.rb$})
#   watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})
#   watch(%r{^app/controllers/(.+)_(controller)\.rb$})
#   watch(%r{^spec/support/(.+)\.rb$})
#   watch('config/routes.rb')
#   watch('app/controllers/application_controller.rb')
#   watch('spec/rails_helper.rb')
# end
