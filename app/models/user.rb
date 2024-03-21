class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # devise já faz alguma validações email senha
  
  validates :name, :phone, presence: true # aqui da para fazer validação avaçadas tipo "DD DataFormatada"

  has_many :addresses

  has_one_attached :avatar

  enum role: { user: 'user', admin: 'admin'}
  # enum: role: ['user', 'admin'] # esses dois funciona, para mapear a tabela aqui  no model
end
