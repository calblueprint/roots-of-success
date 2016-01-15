require "rails_helper"

describe ChangelogItemDecorator do
  let(:with_heading) do
    create :changelog_item, text: '# Hello'
  end

  let(:with_link) do
    create :changelog_item, text: 'Google: www.google.com'
  end

  describe '#markdown_text' do
    it 'renders headings properly' do
      item = ChangelogItemDecorator.decorate with_heading
      expect(item.markdown_text.strip).to eql(
        '<h1>Hello</h1>'
      )
    end

    it 'auto renders links' do
      item = ChangelogItemDecorator.decorate with_link
      expect(item.markdown_text.strip).to eql(
        '<p>Google: <a href="http://www.google.com">www.google.com</a></p>'
      )
    end
  end
end
