module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def survey
    survey = "https://docs.google.com/forms/d/1GmR3t7xz8ce4gdUIQpFgDwKMWuW8ZmHkASq6xXh_ID8/viewform" 
  end 
end
