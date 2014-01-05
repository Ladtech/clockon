$LOAD_PATH.unshift("#{__dir__}/../helpers")
require 'freeagent'
require 'freeagent/pages'


namespace :freeagent do
  include FreeAgent::Pages

  FreeAgent::APPS.each do |name, keys|
    namespace name do
      task :generate_access_token do
        oauth2_client = FreeAgent.client(*keys)
        session = PageMagic.session(:poltergeist)
        session.visit(AppApprovalLoginPage.for(oauth2_client)).login
        authorization_code = session.current_page.authorize
        File.open(".#{name}_token", 'w') { |file| file.write(FreeAgent.token(oauth2_client, authorization_code).token) }
      end
    end
  end
end
