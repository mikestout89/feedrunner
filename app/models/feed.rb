# == Schema Information
#
# Table name: feeds
#
#  id                         :integer          not null, primary key
#  first_name                 :string
#  last_name                  :integer
#  email                      :string
#  ip                         :string

#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feed < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with:  VALID_EMAIL_REGEX}
  # validates :email, presence: true, uniqueness: {case_sensitive:false}, format: {with:  VALID_EMAIL_REGEX}
end
