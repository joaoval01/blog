# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      cannot :read, :all
    else
      can :read, [:index]
      cannot :read, :manage, :all
    end
  end
end
