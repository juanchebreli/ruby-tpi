class Client < ApplicationRecord
   has_many :phones
   has_many :reservations
   has_many :sales

   def addPhones(number)
      Phone.Create(client_id: self.id, numero:number)
   end
   
end
