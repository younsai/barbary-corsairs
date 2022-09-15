class Expert < ApplicationRecord
  belongs_to :user
  has_many :reports, dependent: :destroy
end
