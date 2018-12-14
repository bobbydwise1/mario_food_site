require('pg')
require('pry')

class Review
  attr_accessor :author, :content_body, :rating, :product_id, :id

  def initialize(attributes)
    @author = attributes.fetch(:author)
    @content_body = attributes.fetch(:content_body)
    @rating = attributes.fetch(:rating)
    @product_id = attributes.fetch(:product_id)
    @id = attributes.fetch(:id)
  end

  def ==(other)
    same_class = self.class().eql?(other.class())
    same_author = self.author().eql?(other.author())
    same_class.&(same_author)
  end

  def self.all
    returned_reviews = DB.exec("SELECT * FROM reviews ORDER BY id")
    reviews = []
    returned_reviews.each do |each|
      author = each.fetch("author")
      content_body = each.fetch("content_body")
      rating = each.fetch("rating").to_i
      product_id = each.fetch("product_id").to_i
      id = each.fetch("id").to_i()
      reviews.push(Review.new({:author => author, :product_id => product_id, :id => id}))
    end
    return reviews
  end

  def save
    result = DB.exec("INSERT INTO reviews (author, content_body, rating, product_id) VALUES ('#{@author}', '#{@content_body}', #{@rating}, '#{@product_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def self.find(id)
    returned_reviews = DB.exec("SELECT * FROM reviews WHERE id = #{id};")
    returned_reviews.each() do |review|
      author = review.fetch("author")
      content_body = review.fetch("content_body")
      rating = review.fetch("rating").to_i
      product_id = review.fetch("product_id").to_i
      id = review.fetch("id").to_i()
      return Review.new({:author => author, :product_id => product_id, :id => id})
    end
  end

  def update(attributes)
    new_author = attributes.fetch(:author)
    new_content_body = attributes.fetch(:content_body)
    new_rating = attributes.fetch(:rating).to_i
    found_id = DB.exec("UPDATE reviews SET author = '#{new_author}' WHERE id = #{@id} RETURNING id")
    if found_id
      @author = new_author
      return @author
    end
    return false
  end

  def assign_product_id(attributes)
    new_product_id = attributes.fetch(:product_id)
    found_id = DB.exec("UPDATE reviews SET product_id = #{new_product_id} WHERE id = #{@id} RETURNING id")
    if found_id
      @product_id = new_product_id
      return @product_id
    end
    return false
  end

  def delete
    DB.exec("DELETE FROM reviews WHERE id = #{self.id}")
  end

end
