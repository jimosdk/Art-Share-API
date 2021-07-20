# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  email :string           not null
#  name  :string           not null
#
class User < ApplicationRecord
    validates :name,:email,presence:true
end
