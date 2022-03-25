# frozen_string_literal: true

class HomeController < Rulers::Controller
  def index
    File.open('./public/index.html').read
  end

  def exception
    raise "It's a bad from hone controller!"
  end
end
