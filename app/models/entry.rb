class Entry < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true
    validate :content, presence: true
end
