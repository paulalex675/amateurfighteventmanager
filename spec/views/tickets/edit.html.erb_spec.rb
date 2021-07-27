require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      current_user_id: 1,
      event_id: 1,
      price: 1.5
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input[name=?]", "ticket[current_user_id]"

      assert_select "input[name=?]", "ticket[event_id]"

      assert_select "input[name=?]", "ticket[price]"
    end
  end
end
