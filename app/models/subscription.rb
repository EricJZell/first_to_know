class Subscription < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :twitter_handle, presence: true
  validates :phrase, presence: true

  before_save :downcase_phrase

  def self.by_user(user)
    where(twitter_handle: user)
  end

  def downcase_phrase
    self.phrase = phrase.downcase
  end

end
