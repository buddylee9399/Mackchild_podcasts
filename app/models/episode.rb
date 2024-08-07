# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  podcast_id  :integer          not null
#
# Indexes
#
#  index_episodes_on_podcast_id  (podcast_id)
#
# Foreign Keys
#
#  podcast_id  (podcast_id => podcasts.id)
#
class Episode < ApplicationRecord
  belongs_to :podcast, counter_cache: true
  has_one_attached :episode_thumbnail
  has_one_attached :mp3_file
end
