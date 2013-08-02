require 'hipchat-api'
TOKEN = '0715e6e1239cd2fc1fc81df5723dc2'

namespace :hipchat do
  namespace :notification do
    task :after_restart do
      user = `whoami`.strip
      hostname = `hostname`.strip
      hostinfo = "<b>#{user}@#{hostname}</b>"
      text = "#{hostinfo}: CritiqueApp #{Caps::VERSION} deployed."
      hipchat_api = HipChat::API.new TOKEN
      hipchat_api.rooms_message('DFTi', 'Git Deploy', text, 0, 'red', 'html')
    end
  end
end