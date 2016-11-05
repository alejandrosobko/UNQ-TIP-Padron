class DentistsController < ApplicationController

  def index
    render json: Dentist.all
  end

  def show
    render json: Dentist.find(params[:id])
  end

  def create
    dentist = Dentist.new(dentist_params)
    dentist.work_calendar ||= WorkCalendar.new
    begin
      dentist.save!
      render json: dentist
    rescue => e
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    dentist = Dentist.find(params[:dentist][:id])
    begin
      dentist.update!(dentist_params)
      render json: dentist
    rescue => e
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def create_visit # TODO: Borrar
    dentist = Dentist.find(params[:id])
    visit = VisitService.new(params).find_or_new
    visit.save!
    dentist.visits.push(visit)
    begin
      dentist.save!
      to_render = visit
    rescue => e
      to_render = e.message
    end
    render json: to_render
  end

  def destroy
    Dentist.find(params[:id]).destroy!
    render json: Dentist.all
  end


  private

  def dentist_params
    params.require(:dentist).permit(
        :name, :surname, :enrollment, :specialty, :attention_datetime, locations: [], institutions: [], streets: [], numbers: [],
        telephones: [], cellphones: [], emails:[], visits_attributes: [:id, :visit_date, :observations, visitor_attributes: [:id, :name]],
        work_calendar_attributes: [:dentist_id, :id,
                                   workable_days_attributes: [:work_calendar_id, :id, :day,
                                                              workable_hours_attributes: [:id, :from, :to, :workable_day_id]]])
  end


end
