# == Schema Information
#
# Table name: oauth_applications
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  uid          :string           not null
#  secret       :string           not null
#  redirect_uri :text             not null
#  scopes       :string           default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  owner_type   :string
#

# Custom model for doorkeeper application
class Application < Doorkeeper::Application
end
