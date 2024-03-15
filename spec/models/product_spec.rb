require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Espero validar os campos obrigatório" do 
    it "Verifica se os campos estão presente" do 
      category = create(:category)
      product = build(:product, category_id: category.id) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb
      
      expect(product.valid?).to be_truthy
    end

    it 'Verifica se o campo nome não está presente' do 
      # Arrange, Act, Assert
      product = build(:product, name: nil) 

      expect(product.valid?).to be_falsey
    end

    it 'Verifica se o campo description não está presente' do 
      # Arrange, Act, Assert
      product = build(:product, description: nil) 

      expect(product.valid?).to be_falsey 
    end

    it 'Verifica se o campo price não está presente' do 
      # Arrange, Act, Assert
      product = build(:product, price: nil) 

      expect(product.valid?).to be_falsey 
    end
  end

# validates :name, :description, :price,  presence: true
end
