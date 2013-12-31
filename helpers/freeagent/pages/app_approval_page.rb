module FreeAgent
  module Pages
    class AppApprovalPage
      include PageMagic
      url "#{FreeAgent.client.site}/v2/request_approval"
      button(:authorize_button, name: 'commit')

      def authorize
        authorize_button.click
        puts browser_element.driver.network_traffic.last.url
        browser_element.driver.network_traffic.last.url[/=(.*)&/, 1]
      end
    end
  end
end