class Ability
  include CanCan::Ability

  def initialize(user)


    # Define abilities for the passed in user here. For example:
    #
        user ||= User.new # guest user (not logged in)
        #can :manage, :all
        
        if user.has_role? :admin
         can :manage, :all
        else
            can :read, :all
            cannot :read, User
            can :comments, Discussion, {:id => user.joined_discussions.map(&:id)}
            #cannot? :index, User
            cannot? :create_user,User
            #can :index, Employe, :user => {:id => user.id}
            #can :update, Discussion, :user => {:id =>user.id}
            can :create, Discussion
            #can :edit, Discussion,:user => {:id => user.id}
            cannot :destroy, Discussion,:user => {:id => user.id}
            #can :view_discussion, Discussion, :user => {:id => user.id}
            can :update, Comment, :user => {:id => user.id}
            can :edit, UserProfile, :user => {:id => user.id}
            #can :comments, Discussion,:user => {:id => user.id}
        end
        
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
