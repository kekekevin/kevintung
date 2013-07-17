class Post < ActiveRecord::Base
  
  def published?
    state == :published
  end

end
