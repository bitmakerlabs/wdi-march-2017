class Page < ApplicationRecord

  validates_uniqueness_of :slug, :title
  validates_format_of     :slug, with: /\A[a-z]+\z/

end
