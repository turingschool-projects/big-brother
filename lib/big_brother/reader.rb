class BigBrother::Reader
  def self.lines_from_history_file(filename)
    File.readlines(filename).map(&:strip).reject(&:empty?)
    .map { |line| line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
    .gsub(/\A: \d+:0;/, '') }
  end

  def self.move_history_file
    hist_file     = BigBrother::Settings.get("history_file")
    old_hist_file = BigBrother::Settings.get("history_file") + ".old"
    history = File.read hist_file
    File.write old_hist_file, history
    File.open(hist_file, "w") {}
  end
end
