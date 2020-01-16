# frozen_string_literal: true

class AlbController < ApplicationController

  def healthcheck
    render plain: 'ok'
  end

end

