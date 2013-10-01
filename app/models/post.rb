class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  scope :published, -> { where(:state => :published).order("published_at desc") }

  def published?
    state == :published
  end

end
