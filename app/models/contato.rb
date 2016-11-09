class Contato < ApplicationRecord
  belongs_to :estado
  validates :nome, presence: true
  validates :email, uniqueness: true, presence: true
  validates :idade, presence: true
  validates :contato, presence: true
end
