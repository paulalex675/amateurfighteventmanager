require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      booking_id: 1,
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[booking_id]"

      assert_select "input[name=?]", "ticket[name]"

      assert_select "input[name=?]", "ticket[email]"
    end
  end
end
