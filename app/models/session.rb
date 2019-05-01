class Session
  attr_accessor :resource

  def sign_in(resource)
    @resource = resource
    @signed_in_at = Time.now
  end

  def sign_out
    @resource = nil
    @signed_out_at = Time.now
  end

  def session_time
    "#{minutes} minute(s) and #{seconds} second(s)."
  end

  private

  def minutes
    ((@signed_out_at - @signed_in_at) / 60).floor
  end

  def seconds
    ((@signed_out_at - @signed_in_at) % 60).round
  end
end
