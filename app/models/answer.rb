class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, as: :voteable
  attr_accessible :title, :content, :question_id
end