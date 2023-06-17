require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Tom', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  context 'validating :name' do
    it 'should not valid if not present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should valid if present' do
      expect(subject).to be_valid
    end
  end

  context 'validating :posts_counter' do
    it 'should not valid if less than 0' do
      subject.posts_counter = -4
      expect(subject).to_not be_valid
    end

    it 'should not valid if not integer' do
      subject.posts_counter = 1.345
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    it 'should return the 3 most recent posts' do
      5.times do |_i|
        Post.create(author: subject, title: 'greeting', text: 'hello word')
      end

      recent_posts = subject.most_recent_posts
      expect(recent_posts.length).to eq(3)
    end
  end
end
