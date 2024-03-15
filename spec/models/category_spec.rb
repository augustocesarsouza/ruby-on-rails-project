require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Espero validar os campos obrigatório" do 
    it "Verifica se os campos estão presente" do 
      # Arrange, Act, Assert
      category = build(:category) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb

      expect(category.valid?).to be_truthy # <- esse jeito é mais usado em espresas be_truthy/be_falsey
      # expect(user.valid?).to eq(true)
    end

    it 'Verifica se o campo nome não está presente' do 
      # Arrange, Act, Assert
      category = build(:category, name: nil) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb

      expect(category.valid?).to be_falsey # <- esse jeito é mais usado em espresas be_truthy/be_falsey
    end

    it 'Verifica se o campo position não está presente' do 
      # Arrange, Act, Assert
      category = build(:category, position: nil) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb

      expect(category.valid?).to be_falsey # <- esse jeito é mais usado em espresas be_truthy/be_falsey
    end
  end
end
