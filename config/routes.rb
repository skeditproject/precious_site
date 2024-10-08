Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "theme1/home#home"
  namespace :theme1, path: '', as: 'theme1_home', controller: 'home' do
    get 'about'
    get 'contact'
    get 'faq'
    # get 'our_process'
    get 'services'
    # get 'service_detail'
    get 'service_detail/:tab', to: 'home#service_detail', as: 'service_detail'
    get 'hire_us'
    get 'blogs'
    get 'blog_details'
    get 'career'
    get 'career_detail/:id', to: 'home#career_detail', as: 'career_detail'
    get 'portfolio'
    get 'apply_for_job/:job_id', to: 'home#apply_for_job', as: 'apply_for_job'
    post 'submit_application', to: 'home#submit_application', as: 'submit_application'
    # get 'terms_and_condition'
    get 'privacy_policy'
    # post 'personalized_contact'
    # post 'subscribes'
    get 'technology/:language', to: 'home#technology', as: 'technology'
  end
end
