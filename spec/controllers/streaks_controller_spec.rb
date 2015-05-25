require 'spec_helper'

describe StreaksController, type: :controller do

  describe "GET 'index'" do
    before {
      get 'index', user: 'mzp'
    }
    subject {
      JSON.parse response.body
    }

    it "has current_streak" do
      expect(subject).to have_key('current_streaks')
    end

    it "has data" do
      expect(subject).to have_key('data')
    end
  end

end
