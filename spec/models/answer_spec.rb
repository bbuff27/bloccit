require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "New Question", body: "New Question body", resolved: true)}
  let(:answer) {Answer.create!(body: "New Answer body", question: question)}

  describe "attributes" do
    it "has body attribute" do
      expect(answer).to have_attributes(body: "New Answer body")
    end
  end
end
