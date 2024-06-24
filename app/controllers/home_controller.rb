class HomeController < ApplicationController
  def index
    @time = Rails.cache.fetch("current_time", expires_in: 1.minute) do
      Time.current.to_json
    end
  end
end
