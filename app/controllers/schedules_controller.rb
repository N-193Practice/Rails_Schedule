class SchedulesController < ApplicationController
    # CRUDの作成及びTOPページの作成
    def index
      @schedules = Schedule.all
    end

    def show
      @schedule = Schedule.find(params[:id])
    end

    def new
      @schedule = Schedule.new
    end

    def create
      @schedule = Schedule.new(schedule_params)
      if @schedule.save
        flash[:notice] = 'Schedule created successfully.'
        redirect_to schedules_path
      else
        render 'new'
      end
    end

    def edit
      @schedule = Schedule.find(params[:id])
    end

    def update
      @schedule = Schedule.find(params[:id])
      if @schedule.update(schedule_params)
        flash[:notice] = 'Schedule updated successfully.'
        redirect_to schedules_path
      else
        render 'edit'
      end
    end

    def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.destroy
      flash[:notice] = 'Schedule deleted successfully.'
      redirect_to schedules_path
    end

    private

    def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :schedule_memo)
    end
  end
