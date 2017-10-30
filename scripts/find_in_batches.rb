# ActiveRecord find in batches
# In summary, batch processing allows you to work with the records in batches, thereby instantiating fewer objects and greatly reducing memory consumption. With that handy method, we were able to rewrite our background job and get better results. Using a batch size of 100 allowed us to stay just under the 512mb RAM available at our Heroku worker.
# Taken from: https://blog.codeship.com/improving-rails-performance-better-background-jobs/

class ContentSuggestionWorker
  include Sidekiq::Worker

  def perform
    User.where(subscribed: true).find_in_batches(batch_size: 100) do |group|
      group.each { |user| ContentMailer.suggest_to(user).deliver_now }
    end
  end
end
