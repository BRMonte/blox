   class MeetingRoomsController < ApplicationController
     before_action :set_meeting_room, only: [:show, :edit, :update, :destroy]
     before_action :authenticate_user!, except: [:index, :show]

     def index
       @meeting_rooms = current_user.meeting_rooms
     end

     def new
       @meeting_room = current_user.meeting_rooms.build
     end

     def create
       @meeting_room = current_user.meeting_rooms.build(meeting_room_params)
       if @meeting_room.save
         redirect_to @meeting_room, notice: 'Meeting room was successfully created.'
       else
         render :new
       end
     end

     def edit
     end

     def update
       if @meeting_room.update(meeting_room_params)
         redirect_to @meeting_room, notice: 'Meeting room was successfully updated.'
       else
         render :edit
       end
     end

     def destroy
       @meeting_room.destroy
       redirect_to meeting_rooms_url, notice: 'Meeting room was successfully destroyed.'
     end

     private

     def set_meeting_room
       @meeting_room = MeetingRoom.find(params[:id])
     end

     def meeting_room_params
       params.require(:meeting_room).permit(:name, :location)
     end
   end
