module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <style>
      ul.err { padding: 0; list-style-type: none; }
    </style>
    <div class="row">
      <div class="col-md-3"></div>
      <div id="error_explanation" class="alert alert-danger col-md-6">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <h4>#{sentence}</h4>
        <ul class="err">#{messages}</ul>
      </div>
      <div class="col-md-3"></div>
    </div>
    HTML

    html.html_safe
  end
end
