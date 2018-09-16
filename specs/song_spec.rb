require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../room')
require_relative('../guest')

class SongTest < Minitest::Test

def setup
  @song1 = Song.new("Back to Black", "Amy Winehouse")
  @song2 = Song.new("Architect", "Jane Weaver")
  @song3 = Song.new("Debaser", "The Pixies")
end




end
