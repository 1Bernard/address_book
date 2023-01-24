require './manager'
require './address'

class Application
  def self.run
    menu = Menu.new
    begin
      puts " Simple Address Book Application ".center(50, "#")
      puts "1. Add Contact"
      puts "2. Edit Contact"
      puts "3. View Contact List"
      puts "4. Delete Contact"
      puts "00. End Session"
      print "Select from the options above: "
      user_choice = gets.chomp

      case user_choice
      when '1' then menu.add
      when '2' then menu.edit
      when '3' then menu.show_all
      when '4' then menu.delete
      end  

    end while user_choice != '00'
  end

  class Menu
    def initialize
      @manager = Manager.new
    end

    def add
      puts
      print "First Name: "
      first_name = gets.chomp
      print "Last Name: "
      last_name = gets.chomp
      print "Phone number for #{first_name} #{last_name}: "
      tel = gets.chomp.to_i
      puts
      user_details = "#{first_name} #{last_name} : #{tel}"                 
      address = Address.new(first_name, last_name, tel)
      @manager.store(address)
    end

    def show_all
      @manager.show_all
    end

    def edit
      begin
        @manager.show_all
        entries = @manager.get_all
        if entries.length > 0
          print "Enter Index Number to Edit: "
          index = gets.chomp.to_i
          address = entries.fetch(index-1)
          print "Address: "
          text = gets.chomp
          address.set_text(text)
          @manager.store(address)
          puts "Entry Updated".center(50, "*")
        end
      rescue Exception => e 
        puts "invalid input".center(50, "-")
      end
    end

    def delete
      begin
        @manager.show_all
        entries = @manager.get_all
        if entries.length > 0
          print "Enter Index Number to Delete: "
          index = gets.chomp.to_i
          address = entries.fetch(index-1)
          @manager.delete(address)
          puts "Entry Deleted".center(50, "*")
        end
      rescue Exception => e 
        puts "invalid input".center(50, "-")
      end
    end
  end

end
