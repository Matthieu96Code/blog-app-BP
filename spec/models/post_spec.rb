require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(name: 'Lilly', bio: 'Teacher from Poland.', posts_counter: 0) }
  subject do
    described_class.new(title: 'Hello', text: 'This is my first post', author: user, comments_counter: 0,
                        likes_counter: 0)
  end

  before { subject.save }

  describe 'on validations' do
    it 'should valid with valid tiltle' do
      expect(subject).to be_valid
    end

    it 'should not valid if :title is blank' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'should not valid if title length is greather than 250 character' do
      subject.title = 't' * 260
      expect(subject).to_not be_valid
    end

    it 'should not valid if likes_counter is not integer' do
      subject.likes_counter = 7.23
      expect(subject).to_not be_valid
    end

    it 'should not valid if likes_counter is not greather or equal to 0' do
      subject.likes_counter = -6
      expect(subject).to_not be_valid
    end

    it 'should not valid if comments_counter is not integer' do
      subject.comments_counter = 0.7
      expect(subject).to_not be_valid
    end

    it 'should not valid if comments_counter is not greather or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should belong to the correct user' do
      expect(subject.author).to eql user
    end

    it 'should update counter of related user' do
      expect(subject.author.posts_counter).to eql 1
    end
  end

  describe '#recent_comments' do
    it 'should return the 5 most recent comments' do
      8.times do |_i|
        Comment.create(post: subject, author: user, text: 'nice post')
      end

      recent_comments = subject.most_recent_comments
      expect(recent_comments.length).to eq(5)
    end
  end
end
