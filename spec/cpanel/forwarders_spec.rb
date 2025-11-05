require 'spec_helper'
require 'cpanel'

describe Cpanel::Forwarders do
  let(:client) { Cpanel::Client.new(APIKEY, HOST, USERNAME) }
  let(:domain) { DOMAIN }
  let(:email) { 'test@' + domain }
  let(:forward_to) { 'receiver@example.com' }

  describe '#create_forwarder' do
    it 'creates' do
      response = client.create_forwarder(domain: domain, email: email, forward_to: forward_to)

      expect(response).to be true
    end
  end

  describe '#list_forwarders' do
    it 'shows' do
      response = client.list_forwarders(domain)

      expect(response.to_h['forwarders'].size).to eq 1
    end
  end

  describe '#delete_forwarder' do
    it 'deletes' do
      client.delete_forwarder(email: email, forward_to: forward_to)

      response = client.list_forwarders(domain)
      expect(response.to_h['forwarders'].size).to eq 0
    end
  end
end
