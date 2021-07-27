require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      event_id: 1,
      user_id: 1,
      number_of_guests: 1
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input[name=?]", "booking[event_id]"

      assert_select "input[name=?]", "booking[user_id]"

      assert_select "input[name=?]", "booking[number_of_guests]"
    end
  end
end