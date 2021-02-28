require 'rails_helper'

RSpec.describe ProvidersController, :type => :controller do
  context "GET #index" do
     it "should sucess and render to index page" do
       get :index
       expect(response).to have_http_status(200)
       expect(response).to render_template(:index)      
    end
     
     it "should have one provider" do
        create(:provider)
        get :index
        expect(assigns(:providers)).to_not be_empty     
     end
  end
   
     context "GET #show" do
        let(:provider) { create(:provider)  }
        it "should sucess and render to edit page" do
        get :show, params: {id: provider.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)    
    end 
     
    it "where have id" do
      get :show, params: { id: provider.id}
      expect(assigns(:provider)).to be_a(Provider) 
      expect(assigns(:provider)).to eq(provider)    
    end
  end

    context "GET #new" do
      it "should sucess and render to new page" do
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)      
    end

    it "should new post" do
        get :new
        expect(assigns(:provider)).to be_a(Provider)
        expect(assigns(:provider)).to be_a_new(Provider)    
    end
  end

    context "GET #edit" do
        let(:provider) { create(:provider)  }
        it "should sucess and render to edit page" do
            get :edit, params: {id: provider.id }
            expect(response).to render_template(:edit)
            expect(assigns(:provider)).to be_a(Provider)    
        end   
    end
    
  
    context "POST #create " do
        let!(:params) {
        { buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5', unit_price: 10.00, quantity: 2, address: 'Av Copacabana, 120', supplier: 'Cacau Show' }
        }
        it "create a new post" do
            post :create, params: { provider: params }
            expect(flash[:notice]).to eq("Provider was successfully created.")
            expect(response).to redirect_to(action: :show, id: assigns(:provider).id)    
        end

        it "not create a new post " do
          params =  { buyer: 'Matheus Marques', description: 'R$20 Chocolate for R$5'}
          post :create, params: { provider: params}
          expect(response).to render_template("new") 
        end
    end
    
    context "PUT #update" do
        let!(:provider) { create(:provider) }
        
        it "should update provider info" do
           params =  { buyer: 'Update Matheus Marques'}

           patch :update, params: { id: provider.id, provider: params }
           provider.reload

           expect(provider.buyer).to eq(params[:buyer])
           expect(flash[:notice]).to eq("Provider was successfully updated.")
           expect(response).to redirect_to(action: :show, id: assigns(:provider).id)      
        end
        
        it "should not update post info" do 
            params = { buyer: nil }

            put :update, params: { id: provider.id, provider: params}

            expect(response).to render_template(:edit) 
        end    
    end
    
    context "DELETE #destroy" do
        let!(:provider) { create(:provider)}

        it "should dele provider" do
            delete :destroy, params: { id: provider.id}
            expect(flash[:notice]).to eq("Provider was successfully destroyed.")
            expect(response).to redirect_to(action: :index)
        end  
    end
    
    before :each do
        @file = fixture_file_upload('/home/matheus/Downloads/dados.txt')
      end
end