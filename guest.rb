require('pry')

class Guest

  attr_reader :guest_name, :fave_song
  attr_accessor :wallet

def initialize(guest_name, wallet, fave_song)
  @guest_name = guest_name
  @wallet = wallet
  @fave_song = fave_song
end

def guest_pay_entry(entry_fee)
  @wallet -= entry_fee

end

def sing_song(song)
  "You are the #{song}"
end

def afford_to_sing(guest_cash, entry_fee)
  if guest_cash >= entry_fee
    true
  else
    false
  end
end


#this is the end
end
