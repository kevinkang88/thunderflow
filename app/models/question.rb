class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :voteable
  attr_accessible :title, :content

end