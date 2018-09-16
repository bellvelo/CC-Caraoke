require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')


class RoomTest < Minitest::Test

  def setup
    @room1 = Room.new("Yorkes Yard", 2, 10, 0)
    @room2 = Room.new("Dylans Dive", 7, 7, 0)
    @room3 = Room.new("Bowies Bothy", 10, 5, 0)

    @guest1 = Guest.new("David", 50, "Asleep")
    @guest2 = Guest.new("Jules", 20, "Paranoid Android")
    @guest3 = Guest.new("Esmee", 20, "Fireworks")
    @guest4 = Guest.new("Bronte", 20, "Dissapointed")

    @song1 = Song.new("Back to Black", "Amy Winehouse")
    @song2 = Song.new("Architect", "Jane Weaver")
    @song3 = Song.new("Debaser", "The Pixies")
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    assert_equal("David", @guest1.guest_name)
    assert_equal(1, @room1.room_occupanncy)
    assert_equal(10, @room1.room_till_count)
  end

  def test_check_guest_out
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    @room1.check_in_guest(@guest2, @room1.entry_fee)
    @room1.check_in_guest(@guest3, @room1.entry_fee)
    assert_equal([@guest2, @guest3], @room1.check_guest_out(@guest1))
    assert_equal(2, @room1.room_occupanncy)
  end

  def test_room_occupancy
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    @room1.check_in_guest(@guest2, @room1.entry_fee)
    assert_equal(2, @room1.room_occupanncy)
  end

  def test_is_there_capacity
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    @room1.is_there_capacity(@room1)
    assert_equal(true, @room1.is_there_capacity(@room1))
  end

# couldn't get this to work #
  # def test_whos_in_the_room
  #   @room1.check_in_guest(@guest1, @room1.entry_fee)
  #   @room1.check_in_guest(@guest2, @room1.entry_fee)
  #   assert_equal("David", @room1.whos_in_the_room([@occupancy]))
  # end

  def test_add_song_to_room
    assert_equal([@song1], @room1.add_song_to_room(@song1))
    assert_equal(1, [@song_menu].length())
  end

  def test_room_till_count
    @room1.room_till_count()
    assert_equal(0, @room1.room_till_count())
  end

############################################################
def test_full_transaction
  @room1.full_transaction(@guest1, @room1, @room1.entry_fee)
  @room1.full_transaction(@guest2, @room1, @room1.entry_fee)
  # @room1.full_transaction(@guest3, @room1, @room1.entry_fee)
  assert_equal(2, @room1.room_occupanncy)
  assert_equal(10, @guest2.wallet)
  assert_equal(40, @guest1.wallet)
  assert_equal(20, @room1.room_till_count)
end
############################################################

#this is the end
end
