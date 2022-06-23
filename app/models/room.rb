class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  #retorna todas as salas que NÃO estejam privadas
  after_create_commit { broadcast_append_to "rooms" }

  has_many :messages
end
