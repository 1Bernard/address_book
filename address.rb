require 'securerandom'
require 'json'

class Address 
  attr_reader :id

  def initialize(first_name, last_name, tel)
    @id = SecureRandom.uuid
    first_name = first_name
    last_name = last_name
    tel = tel
    @user_address = {first_name:"#{first_name}", lastname:"#{last_name}", tel:"#{tel}"}
    @user_address.to_json
    @date = Time.now

  end

  def to_s
    "Date: #{@date.strftime("%Y-%m-%d %H:%M:%S")} \nContact Address: #@user_address"
  end

  def set_text(first_name, last_name, tel)
    @user_address = {first_name:"#{first_name}", last_name:"#{last_name}", tel:"#{tel}"}
    @date = Time.now
  end
end  