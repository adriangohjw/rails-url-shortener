# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    @links = Link.order(created_at: :desc).last(100)
  end

  def create
    @link = Link.new(create_params)
    @link.save!
  rescue StandardError => e
    flash.notice = e.message
  ensure
    redirect_to root_path
  end

  def to
    @link = Link.find_by_shortened_path(params[:shortened_path])
    redirect_to @link.original_url, status: :moved_permanently
  rescue StandardError
    redirect_to root_path, notice: 'Link not found'
  end

  private

  def create_params
    params.permit(:original_url, :shortened_path)
  end
end
