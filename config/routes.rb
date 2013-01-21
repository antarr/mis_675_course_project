Fall2012::Application.routes.draw do
  get "expense_reports/index"

  get "home/index"

  resources :budget_items
  resources :budgets
  resources :ministries
  resources :expenses
  resources :accounts
  resources :vendors
  resources :events
  resources :donations
  resources :members

  #resources :member_reports
  #resources :expense_reports

   root :to => 'home#index'

end
