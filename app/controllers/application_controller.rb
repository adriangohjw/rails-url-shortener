# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    @links = Link.order(created_at: :desc).last(100)
  end

  def to
    @link = Link.find_by_shortened_path(params[:shortened_path])
    redirect_to @link.original_url, status: :moved_permanently
  rescue StandardError
    redirect_to root_path, notice: 'Link not found'
  end
end
