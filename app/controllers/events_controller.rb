class EventsController < ApplicationController
        def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(params.require(:event).permit(:name, :date, :time, :location, :url))

        if @event.save 
            redirect_to events_path
        else
            render :event             #if can't save to database (something goes wrong), show us that new page again.
        end 
    end # end of create method

    def edit
        @event = Event.find(params[:id])
    end

    def update
          @event = Event.find(params[:id])

        if @event.update_attributes(params.require(:user).permit(:name, :username, :email, :password, :photo))
            redirect_to events_path
        else
            render :event
        end
    end

    def destroy
    end
end
