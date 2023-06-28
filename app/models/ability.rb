# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[update read destroy], Recipe, user:
  end
end
