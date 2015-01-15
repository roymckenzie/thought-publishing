module ThoughtsHelper

  def published_status(published_time)
    if published_time == nil
      return "Unscheduled"
    elsif published_time >= Time.now
      return "Scheduled for<br> #{published_time.strftime("%B %d, %Y <br>at %H:%M")}".html_safe
    elsif published_time <= Time.now
      return "Published"
    end
  end

  def publish_button(thought)
    if thought.id != nil
      if thought.published == nil
        return link_to("Publish", publish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny default expand')
      elsif thought.published >= Time.now
        return link_to("Publish", publish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny default expand')
      elsif thought.published <= Time.now
        return link_to("Unpublish", unpublish_thought_path(thought), data: { :confirm => "Are you sure?" }, method: :patch, class: 'button tiny secondary expand')
      end
    else
      return submit_tag "Publish", name: "publish", class: "button expand tiny right"
    end
  end

  def get_refer_action
    return Rails.application.routes.recognize_path(request.referrer)[:action]
  end

end
