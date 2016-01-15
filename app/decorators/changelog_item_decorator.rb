class ChangelogItemDecorator < Draper::Decorator
  delegate_all

  def markdown_text
    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML, autolink: true, tables: true
    markdown.render object.text
  end
end
