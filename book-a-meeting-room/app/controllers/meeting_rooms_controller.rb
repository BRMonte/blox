   class MeetingRoomsController < ApplicationController
     before_action :set_meeting_room, only: [:show, :edit, :update, :destroy]
     before_action :authenticate_user!, except: [:index, :show]

     def index
       @meeting_rooms = current_user.meeting_rooms
       render json: @meeting_rooms
     end

     def create
       @meeting_room = current_user.meeting_rooms.build(meeting_room_params)
       if @meeting_room.save
         render json: @meeting_room, status: :created
       else
         render json: @meeting_room.errors, status: :unprocessable_entity
       end
     end

     def update
       if @meeting_room.update(meeting_room_params)
         render json: @meeting_room
       else
         render json: @meeting_room.errors, status: :unprocessable_entity
       end
     end

     def destroy
       @meeting_room.destroy
       head :no_content
     end

     private

     def set_meeting_room
       @meeting_room = MeetingRoom.find(params[:id])
     end

     def meeting_room_params
       params.require(:meeting_room).permit(:name)
     end
   end
