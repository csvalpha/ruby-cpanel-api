require 'spec_helper'
require 'cpanel'

describe CpanelEmail::Accounts do
  let(:client) { CpanelEmail::Client.new(APIKEY, HOST, USERNAME) }
  let(:domain) { DOMAIN }
  let(:email) { 'test@' + domain }
  let(:password) { 'password' }
  let(:quota) { 1024 }

  describe '#create_account' do
    it 'creates' do
      response = client.create_account(domain: domain, email: email, password: password, quota: quota)

      expect(response).to be true
    end
  end

  describe '#list_accounts' do
    it 'shows' do
      response = client.list_accounts(domain: domain)

      expect(response.to_h['accounts'].size).to eq 1
    end
  end

  describe '#get_account_quota' do
    it 'shows' do
      response = client.get_account_quota(domain: domain, email: email)

      expect(response.to_h['quota']).to eq quota
    end
  end

  describe '#set_account_quota' do
    it 'updates' do
      response = client.set_account_quota(domain: domain, email: email, quota: 2048)

      expect(response).to be true

      response = client.get_account_quota(domain: domain, email: email)
      expect(response.to_h['quota']).to eq 2048
    end
  end

  describe '#delete_account' do
    it 'deletes' do
      client.delete_account(domain: domain, email: email)

      response = client.list_accounts(domain: domain)
      expect(response.to_h['accounts'].size).to eq 0
    end
  end
end
