# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  author     :string
#  created_at :datetime
#  updated_at :datetime
#

require 'converts_markdown_to_html'

class Post < ActiveRecord::Base

  def cook
    self.body = ConvertsMarkdownToHTML.convert(self.body)
  end

  def cook!
    cook
    save!
  end
end
