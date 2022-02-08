require_relative "room"
require "byebug"

class Hotel
    def initialize (name, hash)
        @name = name
        @rooms = {}
            hash.each do |room_name, capacity|
                @rooms[room_name] = Room.new(capacity)
        end
    end 
    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end 
    def rooms
        @rooms
    end 

    def room_exists?(room_name)
        rooms.include?(room_name)
    end 

    def check_in(person,room_name)
        if !room_exists?(room_name)
            puts "sorry, room does not exist"
        else 
            @rooms[room_name].add_occupant(person)
          
            if @rooms[room_name].occupants.include?(person)
                puts "check in successful"
            else
               puts 'sorry, room is full'
            end
        end
    end 
   
    def has_vacancy?
        debugger
        rooms.each_value do |room|
        if room.available_space > 0
            return true
        else
            return false
            end 
        end 
    end 

     def list_rooms
    @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
  end

  
end
