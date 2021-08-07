require 'rails_helper'

RSpec.describe "bookings/edit", type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      event_id: 1,
      num_tickets: 1,
      user_id: 1
    ))
  end

  it "renders the edit booking form" do
    render

    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do

      assert_select "input[name=?]", "booking[event_id]"

      assert_select "input[name=?]", "booking[num_tickets]"

      assert_select "input[name=?]", "booking[user_id]"
    end
  end
end
