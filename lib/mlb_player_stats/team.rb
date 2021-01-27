class MlbPlayerStats::Team
  @@all = []

  attr_accessor :name, :url, :players
  attr_writer :players

  def initialize(name, url=nil)
    @name = name
    @players = []
    save
  end

  def self.all
    MlbPlayerStats::Scraper.new.team_names if @@all.empty?
    @@all
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def players
    MlbPlayerStats::Player.all << @players unless MlbPlayerStats::Player.all.include?(@players)
    @players
  end

  # def add_players(arr)
  #   arr.each do |player|
  #     @players << player unless @players.include?(player)
  #     # MlbPlayerStats::Player.new(name, self)
  #     # if player.team == nil
  #     #   player.team = self
  #     # elsif player.name == nil
  #     #   player.name = player
  #     # end
  #   end
  # end
end
