module FreeAgent
  module Pages
    class AppApprovalLoginPage
      include PageMagic

      url FreeAgent.client.auth_code.authorize_url(redirect_uri: 'http://localhost:4567/thing')

      text_field :email, id: 'handle_login_email'
      text_field :password, id: 'handle_login_password'
      button :login_button, name: 'commit'

      def login
        email.set 'lads@lad-tech.com'
        password.set 'Pa55word_1'
        login_button.click
        session.move_to(AppApprovalPage)
      end
    end
  end
end