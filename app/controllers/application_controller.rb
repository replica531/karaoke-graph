class ApplicationController < ActionController::Base
  def hello
    render html: "hello, world1"
  end
end
