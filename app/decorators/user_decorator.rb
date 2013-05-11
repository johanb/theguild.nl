class UserDecorator < ApplicationDecorator
  delegate_all

  def last_sign_in_at
    unless super.nil?
      h.localize model.last_sign_in_at, format: :short
    end
  end

  def created_at
    h.localize model.created_at, format: :short
  end

  def admin
    "&#10004;".html_safe if model.admin?
  end
end
