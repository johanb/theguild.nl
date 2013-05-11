class PostDecorator < ApplicationDecorator
  delegate_all

  def created_at
    h.time_tag model.created_at, pubdate: true, class: 'post_date'
  end

  def link
    h.link_to model.title, model, rel: 'bookmark'
  end

  def summary
    h.markdown model.summary
  end

  def body
    h.markdown model.body
  end
end
