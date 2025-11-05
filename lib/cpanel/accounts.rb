module Cpanel
  module Accounts
    def list_accounts(domain:)
      get("Email/list_pops_with_disk", { domain: domain })
    end

    def create_account(domain:, email:, password:, quota:)
      post("Email/add_pop", { domain: domain, email: email, password: password, quota: quota })
    end

    def delete_account(domain:, email:)
      post("Email/delete_pop", { domain: domain, email: email })
    end

    def get_account_quota(domain:, email:)
      get("Email/get_pop_quota", { domain: domain, email: email })
    end

    def set_account_quota(domain:, email:, quota:)
      post("Email/set_pop_quota", { domain: domain, email: email, quota: quota })
    end
  end
end
