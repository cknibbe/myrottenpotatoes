class Movie < ActiveRecord::Base
  
  class Movie::InvalidKeyError < StandardError ; end
  
  def self.api_key
    '94f6dee3be15099634c52c2107b03f84'
  end
  
   def self.find_in_tmdb(string)
     Tmdb.api_key = self.api_key
     begin
       TmdbMovie.find(:title => string)
     rescue ArgumentError => tmdb_error
       raise Movie::InvalidKeyError, tmdb_error.message
     rescue RuntimeError => tmdb_error
       if tmdb_error.message =~ /status code '404'/
         raise Movie::InvalidKeyError, tmdb_error.message
       else
         raise RuntimeError, tmdb_error.message
       end
     end
   end
end