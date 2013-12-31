$LOAD_PATH.unshift("#{__dir__}/../helpers")
require 'freeagent'
require 'freeagent/pages'


namespace :freeagent do
  task :generate_access_token do
    include FreeAgent::Pages
    session = PageMagic.session(:poltergeist)
    session.visit(AppApprovalLoginPage).login
    authorization_code = session.current_page.authorize
    token = FreeAgent.token(authorization_code)
    File.open('.sandbox_access_code', 'w'){|file| file.write(token.token)}
  end
end
