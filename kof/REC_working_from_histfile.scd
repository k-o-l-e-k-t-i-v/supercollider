s.prepareForRecord("/tmp/record.aiff");
s.record;

h=History.new.loadCS("/home/kof/annex/kof/HistoryLogs/log_History_150603_020439.scd",forward:true);
h.play;

s.stopRecording;
