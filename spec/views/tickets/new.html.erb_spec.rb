require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      current_user_id: 1,
      event_id: 1,
      price: 1.5
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[current_user_id]"

      assert_select "input[name=?]", "ticket[event_id]"

      assert_select "input[name=?]", "ticket[price]"
    end
  end
end
