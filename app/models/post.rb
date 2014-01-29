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

  def self.update_post(params)
    post = Post.find(params[:id].to_i)
    post.update_attributes(title: params[:title],
                           description: params[:description],
                           price: params[:price],
                           email: params[:email],
                           category_id: params[:cat_id])
  end
  # Remember to create a migration!
end
