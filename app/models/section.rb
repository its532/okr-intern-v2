class Section < ApplicationRecord
  has_many :section_okrs
  has_many :personal_okrs
end
