require 'rails_helper'

RSpec.describe "jobs/new.html.haml", :type => :view do
  “describe ​"adding projects"​ ​do​
​ 
​ 
  it ​"allows a user to create a job"​ ​do​
    visit new_job_path
    fill_in ​"property_id"​, with: ​"Project Runway"​ 
    fill_in ​"Description"​, with: ​"This is a new Job"​
    click_on(​"Create Job"​)
    visit jobs_path
    expect(page).to have_content(​"Project Runway"​)
    expect(page).to have_content(​"8"​)
  ​end​
​end​


