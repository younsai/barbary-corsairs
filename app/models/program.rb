class Program < ApplicationRecord
  belongs_to :company
  has_many :reports
  has_many :scopes
end
