module ThoughtsHelper

  def published_status(published)
    if published == nil
      return "Unscheduled"
    elsif published >= Time.now
      return "Scheduled for #{pretty_publish_date_time(published)}".html_safe
    elsif published <= Time.now
      return "#{pretty_publish_date_time(published)}".html_safe
    end
  end

  def pretty_publish_date_time(published)
    if published.present?
      return published.strftime("%B %d, %Y at %l:%M%P")
    else
      return "not yet published"
    end
  end

  def publish_button(thought)
    if thought.id != nil
      if thought.published == nil
        return link_to("Publish", publish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny default right')
      elsif thought.published >= Time.now
        return link_to("Publish", publish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny default right')
      elsif thought.published <= Time.now
        return link_to("Unpublish", unpublish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny secondary right')
      end
    else
      return submit_tag("Publish", name: "publish", class: "button tiny right")
    end
  end

  def get_refer_action
    return Rails.application.routes.recognize_path(request.referrer)[:action]
  end

  def preview_button(thought)
    return submit_tag("Preview", name: "preview", class: "button tiny secondary right")
  end

end
