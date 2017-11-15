class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def cart_action(current_user_id)
    if $redis.hexists "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

end
