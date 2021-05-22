class Address < ApplicationRecord
  belongs_to :hostable, polymorphic: true
end
