class Purchase 
  include ActiveModel::Model

  attr_accessor :postal, :area_id, :city, :addres, :build, :call, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :city
    validates :addres
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code Input correctly' }
    validates :call, length: { maximum: 11 }
    validates :item_id
    validates :user_id
  end

  validates :area_id, numericality: { other_than: 1, message: 'Select' } 
  validates :call, numericality: { only_integer: true, message: 'Input only number' }
  
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    ShippingArea.create(postal: postal, area_id: area_id, city: city, addres: addres, build: build, call: call, record_id: record.id)
  end


end
