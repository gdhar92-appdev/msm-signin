# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

  validates(:email,
    {
      :presence => true,
      :uniqueness => { :case_sensitive => false }
    }
  )

  has_secure_password

  def bookmarks
    my_user_id = self.id
    matching_bookmarks = Bookmark.where({ :user_id => my_user_id })
    return matching_bookmarks
  end

end
