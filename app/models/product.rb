class Product < ApplicationRecord
  belongs_to :category

  validates :name, :description, :price,  presence: true
end

# - esse foi tirado porque ele automaticamente coloca no front mais era bom deixar aqui validado -CAMPO category_id, e o publish nao foi colocado
