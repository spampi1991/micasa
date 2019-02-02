Rails.application.routes.draw do
  resources :houses
  resources :light_supplies do
    resources :invoices, shallow: true
  end
  resources :gas_supplies do
    resources :invoices, shallow: true
  end
  resources :water_supplies do
    resources :invoices, shallow: true
  end
end
