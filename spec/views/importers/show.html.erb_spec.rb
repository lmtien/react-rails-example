require 'rails_helper'

RSpec.describe "importers/show", type: :view do
  before(:each) do
    @importer = assign(:importer, Importer.create!(
      :company => "Company",
      :invoice_num => "Invoice Num",
      :amount => 2.5,
      :reporter => "Reporter",
      :notes => "Notes",
      :status => nil,
      :category => "Category",
      :operation => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Invoice Num/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Reporter/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(//)
  end
end
