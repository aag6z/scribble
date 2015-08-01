class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def date
    return self.created_at.strftime("%b %d %y")
  end

  def time
    return self.created_at.strftime("%I %M %p")
  end
  
end
