class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  class FakeUser
    def admin?
      true
    end
  end

  def current_user
    # stub. should be overwritten in other story
    FakeUser.new
  end
end
