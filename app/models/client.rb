class Client < ApplicationRecord
   has_many :phones
   has_many :reservations
   has_many :sales
end
