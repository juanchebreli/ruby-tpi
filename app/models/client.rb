class Client < ApplicationRecord
   has_many :phones
   has_many :reservations
   has_many :sales

   validates :mail,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true

    validates :cuild, 
    presence: true, 
    uniqueness: true, 
    length: {is: 11}

    validates :nombre,
    format: { with: /\A[a-zA-Z.']+(?:\s[a-zA-Z.']+)*\s?\z/, message: "must contain only letters"}

    validates :iva, 
    presence: true,
    numericality: { less_than_or_equal_to: 14,  only_integer: true }

   def add_phone(number)
   @phone= Phone.create(client_id: self.id, numero:number)
   end
   
end
