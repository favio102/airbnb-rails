# frozen_string_literal: true

class AccountPolicy < ApplicationPolicy
  def show?
    user == record
  end

  def update?
    user == record
  end
end
