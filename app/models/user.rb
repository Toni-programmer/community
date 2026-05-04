class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum :property_type, { propietario: 0, alquilado: 1 }
  enum :role, { user: 0, admin: 1 }
  
def full_name
  [name, lastname].compact.join(" ")
end

def self.ransackable_attributes(auth_object = nil)
  ["name", "lastname", "email"]
end

 def self.ransackable_associations(auth_object = nil)
    []  
 end
   
  
end
