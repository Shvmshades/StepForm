class User < ApplicationRecord
  include Wicked::Wizard::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # before_save :ensure_authentication_token
  attr_accessor :registration_step


  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :on => :create
  validates :password, format: PASSWORD_FORMAT, :on => :create

  

  validates_presence_of :name,:father_name, if: -> { registration_step?(:first) }

    def registration_step?(step_key)
      registration_step == step_key
    end



  

 




  # def self.wizard_steps
  #       [
  #           "first",
  #           "second"
  #       ]
  # end

  #  def self.first_validations    # validations for the  step.
  #       {
  #           name: {
  #               presence: true
  #           },
  #           father_name: {
  #               presence: true
  #           },
  #           DOB: {
  #               presence: true  #this validation only happens on update, not create.
  #           }
  #       }
  #   end

# self.setup_validations!
    
end
