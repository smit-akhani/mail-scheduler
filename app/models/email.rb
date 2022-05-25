class Email < ApplicationRecord
    self.skip_time_zone_conversion_for_attributes = [:scheduled_time]
    def scheduled_time
        t = read_attribute(:scheduled_time)
        t ? Time.local(t.year, t.month, t.day, t.hour, t.min, t.sec) : nil
    end
    after_save_commit do
        GuestsCleanupJob.set(wait_until: scheduled_time).perform_later(self)
    end
end
