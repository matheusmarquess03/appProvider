FactoryBot.define do
    factory :provider do
        buyer { 'Matheus Marques' } 
        description { 'R$20 Chocolate for R$5' }
        unit_price { 10.00 } 
        quantity { 2 } 
        address { 'Av Copacabana, 120' } 
        supplier { 'Cacau Show' }    
    end
end