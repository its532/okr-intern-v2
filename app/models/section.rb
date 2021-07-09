class Section < ApplicationRecord
  has_many :personal_okrs
  has_many :section_okrs
end
