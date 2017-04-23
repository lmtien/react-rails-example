require 'rails_helper'

RSpec.describe "importers/new", type: :view do
  before(:each) do
    assign(:importer, Importer.new(
      :company => "MyString",
      :invoice_num => "MyString",
      :amount => 1.5,
      :reporter => "MyString",
      :notes => "MyString",
      :status => nil,
      :category => "MyString",
      :operation => nil
    ))
  end

  it "renders new importer form" do
    render

    assert_select "form[action=?][method=?]", importers_path, "post" do

      assert_select "input#importer_company[name=?]", "importer[company]"

      assert_select "input#importer_invoice_num[name=?]", "importer[invoice_num]"

      assert_select "input#importer_amount[name=?]", "importer[amount]"

      assert_select "input#importer_reporter[name=?]", "importer[reporter]"

      assert_select "input#importer_notes[name=?]", "importer[notes]"

      assert_select "input#importer_status_id[name=?]", "importer[status_id]"

      assert_select "input#importer_category[name=?]", "importer[category]"

      assert_select "input#importer_operation_id[name=?]", "importer[operation_id]"
    end
  end
end
