require 'bcrypt'

class Customer < ApplicationRecord
    # ID, Forename, Surname, PhoneNumber, Email, Password \(o-o)/
    #validates :forename, :surname, :phonenumber # to be finished
    
    before_action :set_customer, only: [:create]

    has_many :booking

    def show
        
    end

    def password
        @password ||= Password.new(password_hash)
      end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end

    def create
        @user = User.new(params[:user])
        @user.password = params[:password]
        @user.save!
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
            give_token
        else
            redirect_to home_url
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_film
            @film = Customer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def film_params
            params.require(:customer).permit(:forename, :surname, :phoneNumber, :email, :password)
        end

end
