# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Installed by guard-mocha-node

# JavaScript/CoffeeScript watchers

guard 'mocha-node', :mocha_bin => File.expand_path(File.dirname(__FILE__) + "/node_modules/mocha/bin/mocha") do
  watch(%r{^spec/(\w+)_spec\.(js\.coffee|js|coffee)})  { |m| "spec/#{m[1]}_spec.#{m[2]}" }
  watch(%r{^lib/(\w+)\.(js\.coffee|js|coffee)})        { |m| "spec/lib/#{m[1]}_spec.#{m[2]}" }
  watch(%r{spec/spec_helper\.(js\.coffee|js|coffee)}) { "spec" }
	watch(%r{^views/(\w+).(ejs)}) { "spec" }
  watch(%r{^public/javascripts/(\w+).(coffee|js)}) { "spec" }
end

# JavaScript only watchers
#
# guard "mocha-node", :mocha_bin => File.expand_path(File.dirname(__FILE__) + "/node_modules/mocha/bin/mocha")  do
#   watch(%r{^spec/.+_spec\.js$})
#   watch(%r{^lib/(.+)\.js$})     { |m| "spec/lib/#{m[1]}_spec.js" }
#   watch('spec/spec_helper.js')
# end
