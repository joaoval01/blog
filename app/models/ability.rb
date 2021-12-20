# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    if user.present? && user.admin?
      can :manage, :all
    elsif user.present? && user.comentarista?
      can [:create, :update], Evaluation
      can :create, Comment
    end
  end
end
