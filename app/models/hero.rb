class Hero < ApplicationRecord
<<<<<<< HEAD
    validates :name, presence: true
=======
    validates :name, presence: true, uniqueness: {scope: :token, case_sensitive: false}
    validates :token, presence: true, length: {minimum:10}

    scope :by_token, -> (token) {where(token: token)}
    scope :search, -> (name) {where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present?}
    scope :sorted_by_name, -> {order(:name)}
>>>>>>> 16-test-requests
end