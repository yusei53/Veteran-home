# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end
end
