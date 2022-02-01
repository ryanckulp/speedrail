task :insert_task_name => :environment do
  # insert logic, e.g. a cron job for Heroku Scheduler add-on
end

### USER ONBOARDING - run hourly at 0:00 ###
task :reminder_to_start_trial => :environment do
  User.where(created_at: 24.hours.ago..23.hours.ago).each do |user|
    next if user.paying_customer?
    UserMailer.reminder_to_start_trial(user).deliver_later
  end
end

# enable after improving 'finished_onboarding' logic
# task :offer_setup_assistance => :environment do
#   User.subscribed.where(created_at: 48.hours.ago..47.hours.ago).each do |user|
#     next if user.finished_onboarding?
#     UserMailer.offer_setup_assistance(user).deliver_later
#   end
# end

# enable if Stripe subscriptions exist
# task :sync_with_stripe => :environment do
#   subscriptions = Stripe::Subscription.list({limit: 100})
#   subscriptions.each do |subscription|
#     user = User.find_by(stripe_customer_id: subscription.customer)
#
#     if user.nil?
#       AdminMailer.error('User not found for Stripe subscription', "[sync_with_stripe] Customer ID: #{subscription.customer}").deliver_now
#       next
#     end
#
#     if !['trialing', 'active', 'past_due'].include?(subscription.status)
#       user.update(paying_customer: false)
#     end
#   end
# end
