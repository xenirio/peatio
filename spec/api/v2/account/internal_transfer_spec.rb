describe API::V2::Account::InternalTransfers, type: :request do
  let(:endpoint) { '/api/v2/account/internal_transfers' }
  let(:member) { create(:member, :level_3) }
  let(:token) { jwt_for(member) }

  before do
    Ability.stubs(:user_permissions).returns({ 'member' => { 'read' => ['InternalTransfer'], 'create' => ['InternalTransfer'] } })
  end

  describe 'GET /api/v2/account/internal_transfers' do
    let!(:internal_transfer_btc) { create_list(:internal_transfer_btc, 4, :with_deposit_liability, sender: member) }
    let!(:internal_transfer_usd) { create_list(:internal_transfer_usd, 6, :with_deposit_liability, sender: member) }

    context 'unauthorized' do
      before do
        Ability.stubs(:user_permissions).returns([])
      end

      it 'renders unauthorized error' do
        api_get endpoint, token: token, params: { limit: 100 }
        expect(response).to have_http_status 403
        expect(response).to include_api_error('user.ability.not_permitted')
      end
    end

    it 'requires authentication' do
      get endpoint
      expect(response.code).to eq '401'
    end

    it 'validates currency param' do
      api_get endpoint, params: { currency: 'FOO' }, token: token

      expect(response.code).to eq '422'
      expect(response).to include_api_error('account.currency.doesnt_exist')
    end

    it 'returns internal transfers for all currencies by default' do
      api_get endpoint, params: { limit: 100 }, token: token
      result = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response.headers.fetch('Total')).to eq '10'
      expect(result.map { |x| x['currency'] }.uniq.sort).to eq %w[ btc usd ]
    end

    it 'returns all internal transfers' do
      api_get endpoint, token: token
      result = JSON.parse(response.body)
      expect(result.size).to eq 10

      expect(response.headers.fetch('Total')).to eq '10'
    end
    it 'returns internal transfers of BTC currency' do
      api_get endpoint, params: { currency: 'btc' }, token: token
      result = JSON.parse(response.body)

      expect(result.count).to eq 4
    end

    it 'returns internal transfers of USD currency' do
      api_get endpoint, params: { currency: 'USD' }, token: token
      result = JSON.parse(response.body)

      expect(result.count).to eq 6
    end
  end
end
