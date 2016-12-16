class Post < ApplicationRecord

  belongs_to :classmate

  delegate :full_name, to: :classmate, prefix: true
end
