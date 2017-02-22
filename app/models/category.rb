class Category < ActiveRecord::Base
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
   before_validate :create_slug

  def to_param
    slug
  end

  private
  def create_slug
    self.slug = name.parameterize
  end
end
