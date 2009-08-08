class LineChart < Chart
  LINE_CHART_TYPES = { :line_chart => 'lc', :sparkline  => 'ls', :scatter => 'lxy' }

  include CommonParams::ChartColors
  include CommonParams::ChartTitle

  def initialize options = {}
    self.type = options.delete(:type) || :line_chart
    @colors = []
    super
  end

  def type
    "cht=#{@type}"
  end

  def type= type
    raise 'Invalid Chart Type' unless LINE_CHART_TYPES.include?(type)
    @type = LINE_CHART_TYPES[type]
  end
end
