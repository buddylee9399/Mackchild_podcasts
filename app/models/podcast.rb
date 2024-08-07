# == Schema Information
#
# Table name: podcasts
#
#  id             :integer          not null, primary key
#  description    :text
#  episodes_count :integer          default(0), not null
#  itunes         :string
#  podbay         :string
#  stitcher       :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_podcasts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Podcast < ApplicationRecord
  belongs_to :user
  has_many :episodes, dependent: :destroy
  has_one_attached :thumbnail
end
