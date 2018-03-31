require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}
  let(:comment) {Comment.create!(body: "New Comment body", post: post)}

  describe "attributes" do 
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "New Comment body")
    end 
  end
end
