require 'spec_helper'

describe OAuth2::Model::Helpers do
  subject { OAuth2::Model::Helpers }

  describe '.count' do
    let(:owner) { FactoryBot.create(:owner) }

    before do
      3.times { FactoryBot.create(:client, :owner => owner) }
    end

    context 'when conditions are not passed' do
      it 'returns count of total rows' do
        expect(subject.count(owner.oauth2_clients)).to eq(3)
      end
    end

    context 'when conditions are passed' do
      it 'returns count of rows satisfying supplied conditions' do
        expect(subject.count(OAuth2::Model::Client, :client_id => OAuth2::Model::Client.first.client_id)).to eq(1)
      end
    end
  end
end
