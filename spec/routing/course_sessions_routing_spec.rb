require "spec_helper"

describe CourseSessionsController do
  describe "routing" do

    it "routes to #index" do
      get("/course_sessions").should route_to("course_sessions#index")
    end

    it "routes to #new" do
      get("/course_sessions/new").should route_to("course_sessions#new")
    end

    it "routes to #show" do
      get("/course_sessions/1").should route_to("course_sessions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/course_sessions/1/edit").should route_to("course_sessions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/course_sessions").should route_to("course_sessions#create")
    end

    it "routes to #update" do
      put("/course_sessions/1").should route_to("course_sessions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/course_sessions/1").should route_to("course_sessions#destroy", :id => "1")
    end

  end
end
