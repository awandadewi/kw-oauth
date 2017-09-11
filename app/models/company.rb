# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  name             :string
#  ref_id           :string
#  pic              :text
#  meta             :text
#  approved         :boolean          default("f"), not null
#  application_type :string
#  application_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Company < ApplicationRecord

  belongs_to :application, polymorphic: true

  validates :name, presence: true
  validates :ref_id, presence: true
  validates :pic, presence: true
end
