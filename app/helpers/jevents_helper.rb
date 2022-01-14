module JeventsHelper
  def already_ejained?(event)
    current_user.jevents.exists?(event_id: event.id)
  end
end
