class Metric < ApplicationRecord

  belongs_to :contact

  def self.update_view_count(contact:)
    metric = Metric.find_or_initialize_by(date: Date.today, contact: contact)
    metric.views_count = 0 unless metric.views_count
    metric.views_count += 1
    metric.save!
  end
end