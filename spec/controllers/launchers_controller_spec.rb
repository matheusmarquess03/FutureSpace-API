require 'rails_helper'

RSpec.describe LaunchersController, type: :controller do
  let!(:user) { create :user }
  before { sign_in }

  describe 'GET #index' do
    let!(:launcher) { create :launcher }

    subject { get :index }

    context 'when the request is valid' do
      it 'returns 200 ok' do
        subject
        assert_response :success
      end

      it 'returns a launcher' do
        subject
        JSON.parse(response.body)['registros']
        expect(JSON.parse(response.body)['registros']).to eq Launcher.count
      end
    end
  end

  describe 'GET #show' do
    let!(:launcher) { create :launcher }

    subject do
      get :show, params: { launcher: launcher.id }
      JSON.parse response.body
    end

    context 'when the request is valid' do
      it 'retorna 200 ok' do
        assert_response :success
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, params: attributes }

    context 'when the request is valid' do
      let(:attributes) { { external_id: '6a7f56f9-2565', url: 'https://ll.thespacedevs.com', name: 'Sputnik', slug: 'sputnik' } }

      it 'create launcher' do
        subject
        expect(Launcher.count).to eq 1
      end
    end

    context 'when the request is invalid' do
      let(:attributes) { { external_id: '', url: 'https://ll.thespacedevs.com', name: 'Sputnik', slug: 'sputnik' } }

      it 'does not create launcher' do
        subject
        expect(Launcher.count).to eq 0
      end

      it 'returns http status 422' do
        subject
        assert_response :unprocessable_entity
      end
    end
  end

  describe 'PATCH #update' do
    let!(:launcher) { create :launcher }
    subject { patch :update, params: attributes }

    context 'when the request is invalid' do
      let(:attributes) { { id: launcher.id, external_id: '6a7f56f9-', url: 'https://ll.thespacedevs.com.br', name: 'Sputnik1', slug: 'sputnik1' } }
      it 'update launcher' do
        subject
        expect(launcher.reload.name).to eq 'Sputnik1'
      end
    end

    context 'when the request is invalid' do
      let(:attributes) { { id: launcher.id, external_id: '', url: '', name: '', slug: '' } }

      it 'returns http status 422' do
        subject
        assert_response :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:launcher) { create :launcher }

    it 'the launcher is removed' do
      expect do
        delete :destroy, params: { id: launcher.id }
      end.to change(Launcher, :count).by(-1)
    end
  end
end