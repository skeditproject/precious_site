class Theme1::HomeController < ApplicationController
  layout "theme1/application"

  def home
  end

  def services
  end
  
  def service_detail
    @tab = params[:tab]
  end

  def hire_us
  end

  def portfolio
  end

  def career
  end

  def about
  end
end
