require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        # "" => {
        #   number: 0,
        #   shoe: 0,
        #   points: 0,
        #   rebounds: 0,
        #   assists: 0,
        #   steals: 0,
        #   blocks: 0,
        #   slam_dunks: 0
        # },
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        # "" => {
        #   number: 0,
        #   shoe: 0,
        #   points: 0,
        #   rebounds: 0,
        #   assists: 0,
        #   steals: 0,
        #   blocks: 0,
        #   slam_dunks: 0
        # }
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  game_hash
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
          if player == name
            data_item.each do |data, num|
              if data == :points
                points = num
                # return num -- also works
              end
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(name)
  shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
          if player == name
            data_item.each do |data, num|
              if data == :shoe
                shoe = num
                # return num -- also works
              end
            end
          end
        end
      end
    end
  end
  shoe
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names()
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teams << data
      end
    end
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |attribute, data|
        numbers << data[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == name
        return data
      end
    end
  end
end

def big_shoe_rebounds()
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if data[:shoe] > 18
        return data[:rebounds]
      end
    end
  end
end
