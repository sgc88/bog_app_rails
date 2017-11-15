Rails.application.routes.draw do
    root "creatures#index"

    get "/creatures", to: "creatures#index", as: "creatures"
    get"/creatures", to:"creatures#new", as: "new_creature"
    post"/creatures", to:"creatures#create"
    get "/creatures/:id", to: "creatures#show", as: "creature"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
