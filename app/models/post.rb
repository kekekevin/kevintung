class Post < ActiveRecord::Base
  
  scope :published, -> { where(:state => :published).order("published_at desc") }

  def published?
    state == :published
  end

  def to_param
    "#{id} #{title}".parameterize
  end

end
