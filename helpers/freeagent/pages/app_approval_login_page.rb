module FreeAgent
  module Pages
    module AppApprovalLoginPage


      class << self
        def for oauth2_client
          Class.new do

            include PageMagic
            url oauth2_client.auth_code.authorize_url(redirect_uri: 'http://localhost:4567/thing')

            text_field :email, id: 'handle_login_email'
            text_field :password, id: 'handle_login_password'
            button :login_button, name: 'commit'

            define_method :login do
              email.set 'lads@lad-tech.com'
              password.set 'Pa55word_1'
              login_button.click
              session.move_to(AppApprovalPage.for(oauth2_client))
            end
          end
        end
      end


    end
  end
end