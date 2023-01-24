require 'securerandom'

class Address 
  attr_reader :id

  def initialize(first_name, last_name, tel)
    @id = SecureRandom.uuid
    # @first_name = first_name
    # @last_name = last_name
    # @tel = tel
    @user_address = "#{first_name} << #{last_name} <<: #{tel} "
    @date = Time.now

  end

  def to_s
    "Date: #{@date.strftime("%Y-%m-%d %H:%M:%S")} \nContact Address: #@address"
  end

  def set_text(text)
    @text = text
    @date = Time.now
  end
end  