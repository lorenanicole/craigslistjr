class Post < ActiveRecord::Base

  belongs_to :category

  def self.find_these(cat_id)
    cat_posts = []
    Post.all.each do |post|
      if post.category_id == cat_id.to_i
        cat_posts << post
      end
    end
    cat_posts
  end

  def self.create_key
    (0...8).map { (65 + rand(26)).chr }.join
  end
  # Remember to create a migration!
end
