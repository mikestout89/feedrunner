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
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
