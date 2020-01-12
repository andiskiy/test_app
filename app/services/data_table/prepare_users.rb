# frozen_string_literal: true

module DataTable
  class PrepareUsers < Base
    def row(user)
      user = user.decorate
      {
        id: user.id,
        name: user.display_user_link,
        email: user.email,
        created_at: user.display_created_at,
        updated_at: user.display_updated_at
      }
    end
  end
end
