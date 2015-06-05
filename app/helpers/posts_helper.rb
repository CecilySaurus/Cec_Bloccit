module PostsHelper
  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def markdown_title(title)
    render_as_markdown
  end

  def markdown_body(body)
    render_as_markdown
  end
end
