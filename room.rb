require('pry')

class Room

  attr_reader :room_name, :entry_fee
  attr_accessor :capacity, :till

  def initialize(room_name, capacity, entry_fee, till)
    @room_name = room_name
    @capacity = capacity
    @entry_fee = entry_fee
    @till = till
    @occupancy = []
    @song_menu = []
  end


  def check_in_guest(guest, entry_fee)
    @occupancy << guest  #why does this have a nil value?
    @till += entry_fee
  end

  def check_guest_out(guest)
    @occupancy.delete(guest)
    # binding.pry
    return @occupancy
  end

  def room_occupanncy()
    return @occupancy.length()
  end

  def is_there_capacity(room)
    capacity = true
    if room.room_occupanncy >= room.capacity
      capacity = false
    end
    return capacity
  end

# couldn't get this to work #
  # def whos_in_the_room(occupants)  # occupants has a nil value???
  #   # binding.pry
  #   register = occupants.each {|occupant| occupant.guest_name}
  #   return register
  # end

  def add_song_to_room(song)
    @song_menu << song
  end

  def room_till_count()
    @till
  end

############################################################
  def full_transaction(guest, room, entry_fee)
    if is_there_capacity(room) && guest.wallet >= room.entry_fee
      check_in_guest(guest, entry_fee)
      guest.guest_pay_entry(entry_fee) #why? undefined method `guest_pay_entry
    else
      "You keep on knocking, but you can't come in" #can't get this to fail
    end
  end
############################################################

#this is the end
end
