require 'rails_helper'

RSpec.describe "operations/new", type: :view do
  before(:each) do
    assign(:operation, Operation.new(
      :name => "MyString"
    ))
  end

  it "renders new operation form" do
    render

    assert_select "form[action=?][method=?]", operations_path, "post" do

      assert_select "input#operation_name[name=?]", "operation[name]"
    end
  end
end
