class Provider < ApplicationRecord
  
  validates :buyer,:description,:unit_price, :quantity, :address, :supplier, presence: true
  validates :unit_price, numericality: true
  validates :quantity, numericality: { only_integer: true }
  validates :supplier, length: { minimum: 2 }
  
  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      Provider.create!(buyer: row[0], description: row[1], unit_price: row[2], quantity: row[3], address: row[4], supplier: row[5])
    end
  end  

  scope:calculate_total, -> do
		total = (arel_table[:unit_price]*arel_table[:quantity])
		select(total.as('total'))
	end
  
end

