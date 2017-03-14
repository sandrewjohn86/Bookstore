class Book < ActiveRecord::Base
	belongs_to :category
	belongs_to :author
	belongs_to :publisher

	validates :title, presence: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def self.search(query)
		where("title like ? OR category_id like ?", "%#{query}%", "%#{query}%")
	end

end
