module Api
    module V1
        class EntriesController < ApplicationController
            before_action :authenticate_user!
            
            def index
                entries = Entry.all
                render json: {
                    message: "Successfully fetched all Journal Entries",
                    status: "SUCCESS",
                    data: entries
                }, status: :ok
            end

            def create 
                entry = current_user.entries.build(entry_params)
                if entry.save
                    render json: {
                        messages: "Successfully Saved Journal Entry",
                        status: "SUCCESS",
                        data: entry
                    }, status: :ok
                else
                    render json: {
                        message: "Unable to save the Journal Entry",
                        status: "SUCCESS",
                        data: entry.errors
                    }, status: :failure
                end
            end

            def show
                entry = Entry.find(params[:id])
                if entry
                    render json: {
                        message: "Found Journal Entry",
                        status: "SUCCESS",
                        data: entry
                    }, status: :ok
                else
                    render json:{
                        message: "Couldn't find Journal Entry",
                        status: "FAILURE",
                        data: entry.errors
                    }, status: :failure
                end
            end


            def destroy
                entry = Entry.find(params[:id])
                if entry.destroy
                    render json: {
                        message: "Journal Entry SUccessfully Deleted",
                        status: "SUCCESS",
                        data: ""
                    }, status: :ok
                else 
                    render json: {
                        message: "Failed to delete Journal Entry",
                        status: "FAILURE",
                        data: entry.errors
                    }, status: :failure
                end
            end

            private 
                def entry_params
                    params.require(:entry).permit(:content)
                end
        end
    end
end
