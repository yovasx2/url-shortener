class Address < ActiveRecord::Base
  validates :url, :short, presence: true
  validates :url, length: { maximum: 65_535 }
  validates :short, length: { maximum: 255 }
  validate :url_well_formed, unless: -> { url.nil? }

  scope :enlarged, ->(short) { where(short: short) }

  def shorten(length = 6)
    self.short = Digest::SHA256.hexdigest(url)[0...length]
  end

  private

  def url_well_formed
    valid_url = URI.extract(url)
    errors.add(:url, 'not valid') if valid_url.empty?
  end
end
