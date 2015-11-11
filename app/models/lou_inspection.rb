class LouInspection < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  has_many :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}
  scope :ascore, -> {where("score >= ?", 85)}
  scope :cscore, -> {where("score <= ?", 85)}
end

	def index
	  LouInspection.all.paginates_per 50

	end
