class User < ActiveRecord::Base
  acts_as_authentic do
    allow_sudo true
  end
  belongs_to :company
  has_and_belongs_to_many :projects
end