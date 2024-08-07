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
require "test_helper"

class PodcastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
