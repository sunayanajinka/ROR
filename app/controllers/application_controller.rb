class ApplicationController < ActionController::Base
    def hello
        render plain: "hello Sunayana!Welcome to your ToDO Lists App"
      end
end
