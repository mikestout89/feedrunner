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
  after_create :send_feed_data_to_sendy

  def name
    [self.first_name, self.last_name].join(" ")
  end


  private
  def send_feed_data_to_sendy
    data = {name: self.name, email:self.email, list: "dzmpyN7630PwI12W6jOWnEgw", boolean: true}
    r = RestClient.post('http://www.moneyrate360.com/sendy/subscribe', data)
    p ">>>>>>>#{r}"
  end
end
