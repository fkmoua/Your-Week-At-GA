class ResourcesController < ApplicationController
    def index
        @resources = Resource.all
    end

    def show
        @resource = Resource.find(params[:id])
    end

    def new
        @resource = Resource.new
    end

    def create
        @resource = Fesources.new(params.require(:resource).permit(:name, :url, :category))

        if @resource.save 
            redirect_to resources_path
        else
            render :resources             #if can't save to database (something goes wrong), show us that new page again.
        end 
    end # end of create method

    def edit
        @resource = Fesources.find(params[:id])
    end

    def update
          @resource = Fesources.find(params[:id])

        if @resource.update_attributes(params.require(:resources).permit(:name, :url, :category))
            redirect_to resources_path
        else
            render :resources
        end
    end

    def destroy
    end
end
