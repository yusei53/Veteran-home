# frozen_string_literal: true

class AssessmentFormsController < ApplicationController
  def complete; end

  def new
    @form = AssessmentForm.new
  end

  def create
    redirect_to '/assessment_forms/thanks'
  end
end
