# frozen_string_literal: true

class AssessmentFormsController < ApplicationController
  def complete; end

  def new
    @form=AssessmentForm.new
  end
end
