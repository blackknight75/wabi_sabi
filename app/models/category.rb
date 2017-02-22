class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
    # has_and_belongs_to_many :items
  # validates :slug, presence: true, uniqueness: { case_sensitive: false }
  #  before_validate :create_slug

  # def to_param
  #   slug
  # end
  #
  # private
  # def create_slug
  #   self.slug = name.parameterize
  # end
end
