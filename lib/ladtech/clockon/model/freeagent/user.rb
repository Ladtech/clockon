module FreeAgent
  class User
    extend Entity
    def == user
      user.is_a?(FreeAgent::User) && user.url == url
    end
  end
end