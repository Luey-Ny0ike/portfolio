class Blog < ApplicationRecord
  has_many :comments
  belongs_to :admin 
end
