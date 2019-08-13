module Planable
  extend ActiveSupport::Concern

  def upgrade!
    update(paying_customer: true)
  end

  def downgrade!
    update(paying_customer: false)
  end
end
