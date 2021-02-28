require 'rails_helper'

RSpec.describe Provider, :type => :model do
  context "validate supplier's customers" do
    it "buyer is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "buyer is not valid" do
      provider = Provider.new(buyer: nil, description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to_not be_valid  
    end

    it 'retorno não pode ser em branco' do
      provider = Provider.new(buyer: nil, description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      provider.valid?
      expect(provider.errors[:buyer]).to include ("can't be blank")      
    end
  end 
  
  context "validate product description" do
    it "product is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "product is not valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: nil, unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to_not be_valid  
    end

    it 'return cannot be blank' do
        provider = Provider.new(buyer: 'Matheus Marques', description: nil, unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
        provider.valid?
        expect(provider.errors[:description]).to include ("can't be blank")      
      end
  end
  
  context "validate product value" do
    it "is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "value is not valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: nil, unit_price: 'cinco', quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to_not be_valid  
    end
  end

  context "validate product quantity" do
    it "he is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "quantity is not valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2.00, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to_not be_valid  
    end
  end

  context "validate vendor address" do
    it "he is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "address is not valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: nil, supplier: 'Cacau Show')
      expect(provider).to_not be_valid  
    end

    it 'return cannot be blank' do
        provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: nil, supplier: 'Cacau Show')
        provider.valid?
        expect(provider.errors[:address]).to include ("can't be blank")      
    end
  end 

  context "validate supplier name" do
    it "he is valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show')
      expect(provider).to be_valid     
    end 
    
    it "name is not valid" do
      provider = Provider.new(buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'C')
      expect(provider).to_not be_valid  
    end
  end 

end
