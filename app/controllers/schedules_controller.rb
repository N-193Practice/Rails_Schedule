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

    # FlashMessage 
    # flash[:キー名] = "表示させたいメッセージ"
    # 作成
    def create
      @schedule = Schedule.new(schedule_params)
      if @schedule.save
        flash[:notice] = 'Schedule created successfully.'
        redirect_to schedules_path
      else
        flash[:alert] = 'Failed to create schedule.'
        render 'new'
      end
    end

    # 編集 (`update`) アクション:
    def edit
      @schedule = Schedule.find(params[:id])
    end

    def update
      @schedule = Schedule.find(params[:id])
      if @schedule.update(schedule_params)
        flash[:notice] = 'Schedule updated successfully.'
        redirect_to schedules_path
      else
        flash[:alert] = 'Failed to update schedule.'
        render 'edit'
      end
    end

    # 削除アクション
    def destroy
      @schedule = Schedule.find(params[:id])
      if @schedule.destroy
        flash[:notice] = 'Schedule deleted successfully.'
        redirect_to schedules_path
      else
        flash[:alert] = 'Failed to deleted schedule.'
        render 'destroy'
      end
    end

    private

    def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :schedule_memo)
    end
  end
