class UsersController < ApplicationController
    def index
        @userList = User.all
    end
end
