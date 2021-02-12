# frozen_string_literal: true
require 'peatio/aml'

begin
  if Peatio::App.config.aml_backend.present?
    require Peatio::App.config.aml_backend
    Peatio::AML.adapter = "#{Peatio::App.config.aml_backend.capitalize}".constantize.new
  end
rescue StandardError, LoadError => e
  Rails.logger.error { e.message }
end
