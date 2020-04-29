class AttendancesController < ApplicationController
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    #出勤時間が未登録であることを判定する。
    if @attendance.started_at.nil? #出勤時間入力されてますか？
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0)) #入力されてなかったら現在時刻を入れる。
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = "勤怠登録に失敗しました。やり直してください。"
      end
    end
    redirect_to @user
  end
end
