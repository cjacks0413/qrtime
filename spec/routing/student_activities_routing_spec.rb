require "spec_helper"

describe StudentActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/student_activities").should route_to("student_activities#index")
    end

    it "routes to #new" do
      get("/student_activities/new").should route_to("student_activities#new")
    end

    it "routes to #show" do
      get("/student_activities/1").should route_to("student_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_activities/1/edit").should route_to("student_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_activities").should route_to("student_activities#create")
    end

    it "routes to #update" do
      put("/student_activities/1").should route_to("student_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_activities/1").should route_to("student_activities#destroy", :id => "1")
    end

  end
end
