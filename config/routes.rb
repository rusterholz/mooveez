Rails.application.routes.draw do
  # Basic RESTful routes:
  resources :movies, only: %i[index show]

  resources :genres, only: :index

  # Additional (RESTless?) routes, but using the same controller:
  get '/movies/year/:year',   to: 'movies#index', as: :movies_by_year
  get '/movies/genre/:genre', to: 'movies#index', as: :movies_by_genre
end
