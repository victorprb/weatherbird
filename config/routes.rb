Rails.application.routes.draw do
  post '/weather', to: 'city_weathers#weather'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
