class Program < ApplicationRecord
  belongs_to :company
  has_many :reports
end
