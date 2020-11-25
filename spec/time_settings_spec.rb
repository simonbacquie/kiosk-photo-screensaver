require File.expand_path("../../time_settings.rb", __FILE__)
require 'spec_helper'

describe TimeSettings do
  it 'chooses default values when no values are passed in' do
    @settings = TimeSettings.new('', '')
    expect(@settings.stop_time).to eq TimeSettings::DEFAULT_STOP_TIME
    expect(@settings.transition_time).to eq TimeSettings::DEFAULT_TRANSITION_TIME
  end

  it 'chooses default values when invalid values are passed in' do
    @settings = TimeSettings.new('badvalue1', 'badvalue2')
    expect(@settings.stop_time).to eq TimeSettings::DEFAULT_STOP_TIME
    expect(@settings.transition_time).to eq TimeSettings::DEFAULT_TRANSITION_TIME
  end
end
