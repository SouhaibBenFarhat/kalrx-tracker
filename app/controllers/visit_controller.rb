class VisitController < ApplicationController
  skip_before_action :authorize_request

  def init
    session_hash = SecureRandom.alphanumeric(10)
    puts init_parms[:user_hash]
    user_hash = init_parms[:user_hash] || SecureRandom.alphanumeric(10)
    visit = Visit.create!(init_parms.merge({session_hash: session_hash, user_hash: user_hash}))
    json_response(user_hash: visit.user_hash, session_hash: visit.session_hash)
  end

  def ping
    visit = Visit.find_by(session_hash: params[:session_hash])
    visit.update(duration: visit.duration + 1)
    json_response({msg: 'pong'})
  end

  def clearDatabase
    Visit.destroy_all
    json_response({msg: 'sucess'})
  end

  def visits
    json_response(Visit.all)
  end

  private

  def init_parms
    params.permit(:site, :path, :user_hash)
  end

end
