require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("David", 50, "Asleep")
    @guest2 = Guest.new("Jules", 20, "Paranoin Android")
    @guest3 = Guest.new("Esmee", 20, "Fireworks")
    @guest4 = Guest.new("Bronte", 20, "Disapointed")

    @room1 = Room.new("Yorkes Yard", 2, 10, 0)
    @room2 = Room.new("Dylans Dive", 7, 7, 0)
    @room3 = Room.new("Bowies Bothy", 10, 5, 0)

    @song1 = Song.new("Back to Black", "Amy Winehouse")
    @song2 = Song.new("Architect", "Jane Weaver")
    @song3 = Song.new("Debaser", "The Pixies")
  end

  def test_guest_name
    assert_equal("David", @guest1.guest_name)
  end

  def test_guest_funds
    assert_equal(50, @guest1.wallet)
  end

  def test_fave_song
    assert_equal("Asleep", @guest1.fave_song)
  end

  def test_pay_entry
    @guest1.guest_pay_entry(@room1.entry_fee)
    @room1.add_entry_fee_to_till(@room1.entry_fee)
    assert_equal(40, @guest1.wallet)
    assert_equal(10, @room1.room_till_count)
  end

  def test_afford_to_sing
    @guest1.afford_to_sing(@guest1.wallet, @room1.entry_fee)
    assert_equal(true, @guest1.afford_to_sing(@guest1.wallet, @room1.entry_fee))
  end

  def test_sing_song
    @guest4.sing_song(@song2)
    assert_equal("You are the Architect", @guest4.sing_song(@song2.title))
  end

  


#this is the end
end
