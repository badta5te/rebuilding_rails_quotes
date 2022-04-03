# frozen_string_literal: true

class QuotesController < Rulers::Controller
  def index
    render :index, quotes: FileModel.all
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "My quote asdf",
      "attribution" => "Me"
    }
    render :quote, obj: FileModel.create(attrs)
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, obj: quote, ua: ua
  end

  def update_quote
    first_quote = FileModel.find(1)
    first_quote["submitter"] = "Changed submitter"

    first_quote.save

    render :quote, obj: first_quote
  end

  def a_quote
    render :a_quote, noun: :winking
  end

  def quote_1
    render :quote, obj: Rulers::Model::FileModel.find(1)
  end

  def exception
    raise "It's a bad one!"
  end
end
