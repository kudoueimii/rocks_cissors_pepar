
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"

    player_hand = gets.to_i

    while player_hand != 0 && player_hand != 1 && player_hand != 2
      puts "0〜2の数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー" 
      player_hand = gets.to_i
    end

    return player_hand
    
  end  
end


class Enemy
  def hand
    enemy_hand = rand(3)
  end
end


class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    if (player_hand == enemy_hand)
      next_game = true
      puts "あいこ"
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      next_game = false
      puts "あなたの勝ちです"
    else
      next_game = false
      puts "あなたの負けです"
    end
  end
end


class GameStart
  
  def self.jankenpon
    
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

GameStart.jankenpon


