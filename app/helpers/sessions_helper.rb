module SessionsHelper
  
  #引数に渡されたユーザーオブジェクトでログイン
  def log_in(user)
    session[:user_id] = user.id
  end
end
