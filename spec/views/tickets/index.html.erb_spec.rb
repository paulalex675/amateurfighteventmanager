require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        current_user_id: 2,
        event_id: 3,
        price: 4.5
      ),
      Ticket.create!(
        current_user_id: 2,
        event_id: 3,
        price: 4.5
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.5.to_s, count: 2
  end
end
