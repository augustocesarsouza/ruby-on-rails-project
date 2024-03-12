require 'rails_helper'

RSpec.describe User, type: :model do
  context "Espero validar os campos obrigatório" do 
    it "Verifica se os campos estão presente" do 
      # Arrange, Act, Assert
      user = build(:user) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb

      expect(user.valid?).to be_truthy # <- esse jeito é mais usado em espresas be_truthy/be_falsey
      # expect(user.valid?).to eq(true)
    end

    it "Verifica se o campo nome não está presente" do 
      # Arrange, Act, Assert
      user = build(:user, name: nil) # não precisa colocar FactoryBot.build, só build ele consegue dectar porque já foi vinculado com RSpec spec/support/factory_bot.rb

      expect(user.valid?).to be_falsey # <- esse jeito é mais usado em espresas be_truthy/be_falsey
    end

    it "Verifica se o campo phone não está presente" do 
      # Arrange, Act, Assert
      user = build(:user, phone: nil) 

      expect(user.valid?).to be_falsey
    end

    it "Verifica se o campo email não está presente" do 
      user = build(:user, email: nil) 

      expect(user.valid?).to be_falsey 
    end

    it "Verifica se o campo senha não está presente" do 
      user = build(:user, password: nil) 

      expect(user.valid?).to be_falsey
    end

    context "Valida email" do
      it "Verifica se o email é unico" do 
        user1 = create(:user) 
        user2 = build(:user, email: user1.email) 
  
        expect(user2.valid?).to be_falsey
        # binding.pry com isso conseguimos interagir com o teste e ver as class ver os error
      end
      
      it "Validar mensagem de erro para emails unicos" do 
        user1 = create(:user) 
        user2 = build(:user, email: user1.email) 

        user2.save # save se não ele não salva no banco e lança o errors

        expect(user2.valid?).to be_falsey
        expect(user2.errors.size).to be_positive
      end
    end
  end
end
