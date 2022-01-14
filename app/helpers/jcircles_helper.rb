module JcirclesHelper
  def already_cjained?(circle)
    current_user.jcircles.exists?(circle_id: circle.id)
  end
end
