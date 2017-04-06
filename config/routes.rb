Rails.application.routes.draw do
  get ':short', to: 'addresses#enlarge'
  post 'shorten', to: 'addresses#shorten'
end
