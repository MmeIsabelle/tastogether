class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
  end
end
