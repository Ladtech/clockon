module Ladtech
  module Clockon
    module Helpers
      module User
        def user name
          FreeAgent::User.find(name: name)
        end
      end
    end
  end
end