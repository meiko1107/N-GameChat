ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

class Toukou < ActiveRecord::Base
  has_many :comments
end

class User < ActiveRecord::Base
  has_secure_password
  validates :mail,
    presence: true,
    format: {with:/.+@.+/}
  validates :password,
    length: {in: 5..10}
  has_many :toukous
  has_many :user_groups
end

class Group < ActiveRecord::Base
  has_many :user_groups
end

class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end

class Team < ActiveRecord::Base
  has_many :user_teams
end

class UserTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end
