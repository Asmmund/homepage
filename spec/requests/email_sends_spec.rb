require 'spec_helper'

describe "EmailSends" do
  it "emails admin when article is created" do
    @user = FactoryGirl.create(:user)
    session[:user_id] = user.id
    article = FactoryGirl.create(:article)
  end
end
