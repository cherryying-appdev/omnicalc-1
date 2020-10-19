class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    # params = {"number"=>"42"}

    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    # params = {"user_number"=>"44"}

    @user_num = params.fetch("user_number").to_f
    @square_root_of_num = @user_num ** (0.5)
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment

    @apr = params.fetch("user_apr").to_f
    @rate = @apr/12/100
    @num_of_years = params.fetch("user_years").to_i
    @principal = params.fetch("user_principal").to_f
    @payment = (@rate*@principal) / (1-(1+@rate)**(-@num_of_years*12))
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end
end
