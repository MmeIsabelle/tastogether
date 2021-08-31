class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.correspondents_for(user).map do |correspondent| 
        scope.new(main_user: user, other_user: correspondent)
      end
    end
  end
end
