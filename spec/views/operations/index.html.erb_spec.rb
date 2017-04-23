require 'rails_helper'

RSpec.describe "operations/index", type: :view do
  before(:each) do
    assign(:operations, [
      Operation.create!(
        :name => "Name"
      ),
      Operation.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of operations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
