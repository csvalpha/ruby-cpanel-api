module Cpanel
  # All SMTP related endpoints
  module SMTP
    def list_smtp(domain, params = {})
      get("/domains/#{domain}/credentials/", params).to_h
    end

    def create_smtp(username, password, domain)
      response = post("/domains/#{domain}/credentials/", { username: username, password: password })

      response.ok?
    end

    def delete_smtp(username, domain)
      response = delete("/domains/#{domain}/credentials/#{username}")

      response.ok?
    rescue NotFoundError
      true
    end
  end
end
