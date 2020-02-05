class DelayedJob < Delayed::Job
  scope :failed, -> { where.not(last_error: nil) }
  scope :by_class_name, -> (class_name) do
    where("handler like ?", "%#{class_name}%")
  end

  def retry
    Delayed::Worker.new.run(self)
  end
end