json.imdb_id              @movie.imdbId
json.title                @movie.title
json.description          @movie.overview
json.release_date         @movie.releaseDate
json.budget               number_to_currency(@movie.budget)
json.runtime              @movie.runtime
# json.avg_rating           @movie.avg_rating
json.genres               @movie.genres
json.language             @movie.language
json.production_companies @movie.productionCompanies
