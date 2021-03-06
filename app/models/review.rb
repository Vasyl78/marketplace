# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  object_id   :integer
#  object_type :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true
end
