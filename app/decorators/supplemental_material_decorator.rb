class SupplementalMaterialDecorator < Draper::Decorator
  delegate_all

  def markdown_content
    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML, autolink: true, tables: true
    markdown.render object.content
  end
end
