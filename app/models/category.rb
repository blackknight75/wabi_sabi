class Category < ActiveRecord::Base
  before_validation :create_slug
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_many :item_categories
  has_many :items, through: :item_categories


  def to_param
    slug
  end

  private
  def create_slug
    self.slug = name.parameterize
  end
end
