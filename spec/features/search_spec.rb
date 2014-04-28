# encoding: utf-8

require "spec_helper"

@javascript
describe "Peek.com ", :sauce => true do
  # in real life this should probably be broken into pieces
  it "Should find Las Vegas", :js => true do
    visit "http://www.peek.com/"

    els = all("div", :text => "Choose a Place")
    els.last.click

    find("a", :text => "Las Vegas »").click
    page.should have_content "Book Amazing Activities in Las Vegas"

    fill_in("search", :with => "mob museum")
    click_button "Search »"
    page.should have_content "The Mob Museum"

    find("a", :text => "The Mob Museum »").click
    page.should have_content "Uncover Vegas's darker history"

    tomorrow = Date.today + 1
    el = page.all(".calendar-date", :text => tomorrow.day.to_s).first
    # el = find(".calendar-date", :text => tomorrow.day.to_s)
    el.click
    sleep(2)

    click_button "Reserve Your Spot"
    sleep(2)

    page.should have_content "Admission to Mob Museum Las Vegas - 1x Adult (18+)"
    page.should have_content "#{tomorrow.month}/#{tomorrow.day}/#{tomorrow.year}"
  end
end
