class LouInspection < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  belongs_to :business
  # has_many :business_id, through: :business
  # belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order(s"created_at DESC")}
  scope :ascore, -> {where("score >= ?", 85)}
  scope :cscore, -> {where("score <= ?", 85)}

  accepts_nested_attributes_for :business

#  params = { lou_inspection: {
#   business_id: 'some number', business_attributes: [
#     { name: 'Kari, the awesome Ruby documentation browser!' }
#   ]
# }}

# lou_inspection = LouInspection.create(params[:business])
# lou_inspection.business

end

	def index
	  @lou_inspections = LouInspection.all.paginates_per 50

	end
