# == Schema Information
#
# Table name: loans
#
#  id               :integer          not null, primary key
#  amount           :float
#  detail           :text
#  user_email       :string
#  application_type :string
#  application_id   :integer
#  company_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Loan < ApplicationRecord

  belongs_to :company
  belongs_to :application, polymorphic: true

  validates :amount, presence: true
  validates :user_email, presence: true
  validates :company, presence: true
end
