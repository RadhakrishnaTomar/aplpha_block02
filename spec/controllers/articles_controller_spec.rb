require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
        let!(:user) { create(:user) }

  describe 'GET index' do
    before {get :index}

    context 'when some article present' do
    let!(:article) { create(:article,user: user) }

      it 'assigns @artilces' do
        expect(assigns(:articles)).to eq([article])
      end

      it 'renders the index template' do
          expect(response).to render_template("index")
      end
    end
   end

  describe 'GET new' do 
    before {get :new}
    it 'assigns @word' do
        expect(assigns(:article)).to be_a_new(Article)
    end

    it 'renders the new template' do
        expect(response).to render_template("new")
    end
  end
    
  describe 'POST create' do
    let!(:user) {create(:user)}

    context "when the user valid params" do
      subject { post :create, params:{ article: attributes_for(:article),user_id: user.id}}
      it 'creates a new word' do 
      expect { subject }.to change(Article, :count).by(1)
      end
    end
    it 'will not create user' do
      post :create, params:{ article: { title: " ",description: "radhakrishnatomar" },user: nil }  
      #expect(body["errors"]).to eq(["Email can't be blank"])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end


  # describe 'GET show' do 
  #   it "will the return the data " do
  #    get :show params:{user:  }
  #   end
  # end



end 

# describe 'POST create' do
#   byebug

#   let!(:user) { create(:user) }

#   context "when the user valid params" do
#     subject { post :create, params: { article: attributes_for(:article), user_id: user.id } }

#     it 'creates a new word' do
#       expect { subject }.to change(Article, :count).from(0).to(1)
#     end
#   end

#   context "when a user is invalid" do
#     subject { post :create, params: { article: attributes_for(:article), user_id: nil } }

#     it "user can not create article" do
#       expect { subject }.not_to change(Article, :count)
#     end
#   end
# end
