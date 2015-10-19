class LouViolation < ActiveRecord::Base
  require 'csv'
  belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}
  
  
end
