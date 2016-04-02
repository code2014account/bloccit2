require 'rails_helper'

RSpec.describe Post, type: :model do
# #1
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

  describe "attributes" do
# #2
    it "responds to title" do
      expect(post).to respond_to(:title)
    end
# #3
    it "responds to body" do
      expect(post).to respond_to(:body)
    end
  end
end
