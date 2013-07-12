class InsertFirstBlogPost < ActiveRecord::Migration

  def up
    p = Post.new
    p.published_at = Time.now
    p.state = :published
    p.title = "First blog post. yay"
    p.body = "so let me mention that creating a blog post through a db migration script(which is what i'm doing now) probably isn't a very good long term solution. \
    however, i haven't built out any of the admin functionality for this website so this will have to suffice.  i could also just use the rails console and create \
    the db entry, but oh well.  there's a bunch of stuff on my todo list for this site that i'll eventually get around to.  what's going to sap my time next is \
    replacing the screen for my nexus 7.  nexus 7's apparently have very weak glass faces.  mine was shattered completely with a 1ft fall to the ground.  the \
    glass screen and digitizer isn't too expensive so i'll just opt to fix it."
    Post.create p.attributes
  end

  def down
    Post.all.each { |p| Post.delete p }
  end

end
