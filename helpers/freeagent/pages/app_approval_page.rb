module FreeAgent
  module Pages
    module AppApprovalPage

      class << self
        def for oauth2_client
          Class.new do
            include PageMagic
            url "#{oauth2_client.site}/v2/request_approval"
            button(:authorize_button, name: 'commit')

            def authorize
              authorize_button.click
              browser_element.driver.network_traffic.last.url[/=(.*)&/, 1]
            end
          end
        end
      end

    end
  end
end