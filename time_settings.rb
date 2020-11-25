class TimeSettings

  DEFAULT_STOP_TIME = 0;
  DEFAULT_TRANSITION_TIME = 0;

  attr_accessor :stop_time, :transition_time

  def initialize(stop_time, transition_time)
    if (stop_time.to_i) > 0
      @stop_time = stop_time.to_i
    else
      @stop_time = DEFAULT_STOP_TIME
    end

    if (transition_time.to_i) > 0
      @transition_time = transition_time.to_i
    else
      @transition_time = DEFAULT_TRANSITION_TIME
    end
  end

end
