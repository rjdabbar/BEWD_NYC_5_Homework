
class Movie
  attr_accessor :title, :year, :rating, :released, :runtime 
  attr_accessor :genre, :director, :writer, :actors, :plot, :poster 
  attr_accessor :imdb_rating, :imdb_votes, :imdb_id, :type, :response 
  attr_accessor :tomato_meter, :tomato_image, :tomatoe_rating, :tomato_reviews
  attr_accessor :tomato_fresh, :tomato_rotten, :tomato_consensus, :tomatoe_user_meter 
  attr_accessor :tomato_user_rating, :tomato_user_reviews, :dvd_date, :box_office_cash
  attr_accessor :producers, :website
  

  def initialize(hash)
    @title = hash["Title"]
    @year = hash["Year"]
    @rating = hash["Rated"]
    @released = hash["Released"]
    @runtime = hash["Runtime"]
    @genre = hash["Genre"]
    @director = hash["Director"]
    @writer = hash["Writer"]
    @actors = hash["Actors"]
    @plot = hash["Plot"]
    @poster = hash["Poster"]
    @imdb_rating = hash["imdbRating"]
    @imdb_votes = hash["imdbVotes"]
    @imdb_id = hash["imdbID"]
    @type = hash["Type"]
    @response = hash["Response"]

    @tomato_meter = hash["tomatoMeter"]
    @tomato_image = hash["tomatoImage"]
    @tomato_rating = hash["tomatoRating"]
    @tomato_reviews = hash["tomatoReviews"]
    @tomato_fresh = hash["tomatoFresh"]
    @tomato_rotten = hash["tomatoRotten"]
    @tomato_consensus = hash["tomatoConsensus"]
    @tomatoe_user_meter = hash["tomatoUserMeter"]
    @tomato_user_rating = hash["tomatoUserRating"]
    @tomato_user_reviews = hash["tomatoUserReviews"] 
    @dvd_date = hash["DVD"] 
    @box_office_cash = hash["BoxOffice"]
    @producers = hash["Production"]
    @website = hash["Website"]

  end

  def check_rating
    rating = @imdb_rating.to_f

    if rating >= 9.0
      "#{@title} was mind-blowingly awesome"
    elsif rating >= 7.5 && rating < 9.0
      "#{@title} was a really good movie"
    elsif rating >= 5.0 && rating < 7.5
      "#{@title} was OK"
    else
      "#{@title} is not so great"
    end

  end

  def is_it_suitable_for_kids
    mpaa = @rating

    if mpaa == "G" || mpaa == "PG"
      "#{@title} is suitable for children of all ages!"
     elsif mpaa == "PG-13"
      "#{@title} is not suitable for children under 13."
    else
      "#{@title} is rated R and not suitable for children."
    end
  end

  def check_genres
    "#{@title} is a #{@genre} film."
  end


  def go_to_website
    if @website == "N/A"
      puts "There is no website, sorry!"
    else
      Launchy.open "#{@website}"
    end
  end

  def compare_rt_scores
    critic_r = @tomato_rating.to_f
    user_r = @tomato_user_rating.to_f

    rating_diff = (critic_r - user_r).abs*10

    if critic_r > user_r
      "The critics liked #{@title} more by #{rating_diff}%"
    elsif user_r > critic_r
      "The general population liked #{@title} more by #{rating_diff}%"
    else 
      "The critics and audiences agreed on the quality of #{@title}!"
    end    
  end

  def fresh?
    if @tomato_image == "certified"
      "#{@title} was certified fresh!"
    elsif @tomato_image == "rotten"
      "#{@title} was deemed rotten!"
    end
  end




end
