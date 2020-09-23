# frozen_string_literal: true

# :nodoc:
class Player
  attr_reader :name
  attr_accessor :wins

  def initialize(name, wins = 0)
    @name = name
    @wins = wins
  end
end
