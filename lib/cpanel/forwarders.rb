module Cpanel
  module Forwarders
    def list_forwarders(domain)
      get("Email/list_forwarders", { domain: domain })
    end

    def create_forwarder(domain:, email:, forward_to:)
      post("Email/add_forwarder", { domain: domain, email: email, fwdopt: "fwd", fwdemail: forward_to })
    end

    def delete_forwarder(email:, forward_to:)
      post("Email/delete_forwarder", { email: email, fwdopt: "fwd", fwdemail: forward_to })
    end
  end
end
