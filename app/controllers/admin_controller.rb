# frozen_string_literal: true

class AdminController < ApplicationController # rubocop:disable Style/Documentation
  before_action :check_admin_priv
  def show # rubocop:disable Style/EmptyMethod,Lint/RedundantCopDisableDirective
  end
end
