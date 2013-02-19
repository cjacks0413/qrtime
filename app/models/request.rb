class Request < ActiveRecord::Base
   attr_accessible :subject, :content, :read
end
