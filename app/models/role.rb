class Role < ActiveRecord::Base
  belongs_to :user
  scope :role_filter, -> (name) { where('name like ?', "%#{name}%")}
  # scope :search, -> (q) { where('name like ?', "%#{q}%") }
end
