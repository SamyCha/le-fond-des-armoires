class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true  # Tous les users peuvent créer des produits
    end

    def show?
      true   #Tous les users peuvent voir des produits
    end

     def update?
      user_owner_or_admin?
    end

     def destroy?
      user_owner_or_admin?
    end

  private
    def user_owner_or_admin?
      user.admin || record.user == user   #Est-ce que je suis admin ou est-ce que le produit m'appartient
    end


end
