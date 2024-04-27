class MailLog < ApplicationRecord
  belongs_to :user, optional: true

  # :nocov:
  def self.ransackable_attributes(*)
    ["body", "created_at", "id", "id_value", "mailer", "subject", "to", "updated_at", "user_id"]
  end

  def self.ransackable_associations(*)
    ["user"]
  end
  # :nocov:
end
