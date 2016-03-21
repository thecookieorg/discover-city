class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can :access, :rails_admin   # grant access to rails_admin
         can :dashboard
         can :manage, :all
         can :manage, Phone
         can :manage, WeatherGrid
         can :manage, WeatherLocation
         can :manage, Restaurant
         can :manage, LiquorStore
         can :manage, Accommodation
       else
         can :read, :all
         can :read, Phone
         can :read, WeatherGrid
         can :read, WeatherLocation
         can :read, Restaurant
         can :upvote, Restaurant
         can :downvote, Restaurant
         can :read, LiquorStore
         can :read, Accommodation
       end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
