require 'spec_helper'

describe ErrorsController do

  describe "GET 'handle404'" do
    it "returns http success" do
      get 'handle404'
      response.should be_success
    end
  end

end
