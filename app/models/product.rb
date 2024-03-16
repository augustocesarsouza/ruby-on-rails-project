class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :big_thumb, resize_to_limit: [600, 700]
  end

  belongs_to :category

  validates :name, :description, :price,  presence: true
end

# - esse foi tirado porque ele automaticamente coloca no front mais era bom deixar aqui validado -CAMPO category_id, e o publish nao foi colocado
