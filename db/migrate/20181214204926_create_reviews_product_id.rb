class CreateReviewsProductId < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_product_ids do |t|
      add_column :reviews, :product_id, :integer
    end
  end
end
