class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  scope :published, -> { where(:state => :published).order("published_at desc") }
  
  has_and_belongs_to_many :tags

  def published?
    state == :published
  end

end
