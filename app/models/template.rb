class Template < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "450x450>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :source
  before_create :generate_uname

  scope :latest, -> { order( id: :desc ) }

private

  def generate_uname
    chars = ([('A'..'Z'), (1..9)].map { |i| i.to_a }.flatten-['A','O','I','U','E'])
    begin
      uname = chars.sample(8).join
    end while Template.where(uname: uname).exists?
    write_attribute :uname, uname
  end

end
