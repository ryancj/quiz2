class Request < ActiveRecord::Base

  def self.search(search)
    where('name ILIKE :name OR email ILIKE :email OR department ILIKE :department OR message ILIKE :message',
          name: "%#{search}%", email: "%#{search}%", department: "%#{search}%", message: "%#{search}%")
  end

end
