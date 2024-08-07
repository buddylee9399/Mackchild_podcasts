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
require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
