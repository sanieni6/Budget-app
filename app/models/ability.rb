class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all, user_id: user.id

    can :index, MainController, public: true
  end
end
