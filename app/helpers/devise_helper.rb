# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    html = ''
    resource.errors.full_messages.each do |errmsg|
      html += <<-HTML
      <div class="alert alert-danger alert-dismissible" role="alert">
        #{errmsg}
      </div>
      HTML
    end
    html.html_safe
  end
end
