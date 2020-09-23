# frozen_string_literal: true

require './lib/main.rb'
require './lib/player.rb'

describe TicTacToe do
  describe '#create_players' do
    game = TicTacToe.new
    it 'player one exists' do
      game.player_one = Player.new('hans')
      expect(game.player_one.name).not_to be_empty
    end
    it 'player two exists' do
      game.player_two = Player.new('joao')
      expect(game.player_two.name).not_to be_empty
    end
  end
  describe '#check_lines' do
    game = TicTacToe.new
    it 'player 1 can win on line 1' do
      game.line_1 = ['X', 'X', 'X']
      expect(game.line_1).to eql ['X', 'X', 'X']
    end
    it 'player 1 can win on line 2' do
      game.line_2 = ['X', 'X', 'X']
      expect(game.line_2).to eql ['X', 'X', 'X']
    end
    it 'player 1 can win on line 3' do
      game.line_3 = ['X', 'X', 'X']
      expect(game.line_3).to eql ['X', 'X', 'X']
    end
    it 'player 1 can win in first diagonal' do
      game.line_1[0] = 'X'
      game.line_2[1] = 'X'
      game.line_3[2] = 'X'
      expect(game.line_1[0]).to eql 'X'
      expect(game.line_2[1]).to eql 'X'
      expect(game.line_3[2]).to eql 'X'
    end
    it 'player 1 can win in second diagonal' do
      game.line_1[2] = 'X'
      game.line_2[1] = 'X'
      game.line_3[0] = 'X'
      expect(game.line_1[2]).to eql 'X'
      expect(game.line_2[1]).to eql 'X'
      expect(game.line_3[0]).to eql 'X'
    end
    it 'player 2 can win on line 1' do
      game.line_1 = ['O', 'O', 'O']
      expect(game.line_1).to eql ['O', 'O', 'O']
    end
    it 'player 2 can win on line 2' do
      game.line_2 = ['O', 'O', 'O']
      expect(game.line_2).to eql ['O', 'O', 'O']
    end
    it 'player 2 can win on line 3' do
      game.line_3 = ['O', 'O', 'O']
      expect(game.line_3).to eql ['O', 'O', 'O']
    end
    it 'player 2 can win in first diagonal' do
      game.line_1[0] = 'O'
      game.line_2[1] = 'O'
      game.line_3[2] = 'O'
      expect(game.line_1[0]).to eql 'O'
      expect(game.line_2[1]).to eql 'O'
      expect(game.line_3[2]).to eql 'O'
    end
    it 'player 2 can win in second diagonal' do
      game.line_1[2] = 'O'
      game.line_2[1] = 'O'
      game.line_3[0] = 'O'
      expect(game.line_1[2]).to eql 'O'
      expect(game.line_2[1]).to eql 'O'
      expect(game.line_3[0]).to eql 'O'
    end
  end
end
