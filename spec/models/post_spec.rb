require 'rails_helper'

RSpec.describe Post, type: :model do
# #1
let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
# #4
let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

let(:post) { topic.posts.create!(title: title, body: body, user: user) }


it { is_expected.to have_many(:comments) }
it { is_expected.to belong_to(:topic) }
it { is_expected.to belong_to(:user) }

it { is_expected.to have_many(:favorites) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }

# 2
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }

  describe "attributes" do


    it "has a title, body, and user attribute" do
      expect(post).to have_attributes(title:title, body: body, user: user)
    end
  end
end
