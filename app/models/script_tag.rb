class ScriptTag < ApplicationRecord
  scope :enabled, -> { where(enabled: true) }
  scope :disabled, -> { where(enabled: false) }

  validates_presence_of :name, :code

  # :nocov:
  def self.ransackable_attributes(*)
    ["code", "created_at", "enabled", "id", "id_value", "name", "updated_at"]
  end
  # :nocov:
end
