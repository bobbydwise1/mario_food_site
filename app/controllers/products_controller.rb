require('pg')
require('pry')

class Product
  attr_accessor :name, :cost, :origin, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @cost = attributes.fetch(:cost).to_f
    @origin = attributes.fetch(:origin)
    @id = attributes.fetch(:id).to_i
  end

  def ==(other)
    same_class = self.class().eql?(other.class())
    same_name = self.name().eql?(other.name())
    same_class.&(same_name)
  end

  def self.all
    returned_proudcts = DB.exec("SELECT * FROM proudcts ORDER BY id")
    proudcts = []
    returned_proudcts.each do |each|
      name = each.fetch("name")
      cost = each.fetch("cost").to_f
      origin = each.fetch("origin")
      id = each.fetch("id").to_i()
      proudcts.push(Product.new({:name => name, :cost => cost, :origin => origin, :id => id}))
    end
    return proudcts
  end

  def save
    result = DB.exec("INSERT INTO proudcts (name, cost, origin) VALUES ('#{@name}', #{@cost}, '#{@origin}') RETURNING id")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    returned_proudcts = DB.exec("SELECT * FROM proudcts WHERE id = #{id}")
    returned_prouducts.each() do |product|
      name = product.fetch("name")
      cost = product.fetch("cost").to_f
      origin = product.fetch("origin")
      id = proudct.fetch("id").to_i
      return Product.new({:name => name, :id => id})
    end
  end

  def reviews
    returned_reviews = DB.exec("SELECT * FROM reviews WHERE proudct_id = #{self.id}")
    review_array = []
    returned_reviews.each() do |review|
      author = review.fetch("author")
      content_body = review.fetch("content_body")
      rating = review.fetch("rating")
      proudct_id = review.fetch("proudct_id")
      id = review.fetch("id").to_i()
      review_array.push(Review.new({:author => name, :content_body => content_body, :rating => rating, :proudct_id => proudct_id, :id => id}))
    end
    return review_array
  end

  def update(attributes)
    new_name = attributes.fetch(:name)
    new_cost = attributes.fetch(:cost)
    new_origin = attributes.fetch(:origin)
    found_id = DB.exec("UPDATE proudcts SET name = '#{new_name}' WHERE id = #{@id} RETURNING id")
    if found_id
      @name = new_name
      @cost = new_cost
      @origin = new_origin
      return true
    end
    return false
  end

  def delete
    DB.exec("DELETE FROM proudcts WHERE id = #{self.id}")
    # DB.exec("DELETE FROM volunteers WHERE proudct_id = #{@self.id}")
  end

end
