(
var sysTime, syncTime, newTime;
sysTime = SystemClock.beats;
postf("\nCurrent system time is %\n", sysTime);

syncTime = sysTime%1;
postf("PING --- time to sync is %\n\n", syncTime);

newTime = TempoClock(1,0,syncTime);
postf("SystemTime : %\nNewTime : %\n", SystemClock.beats, newTime.beats);

newTime.sched(1, { postf("\n2ndTry\nSystemTime : %\nNewTime : %\n", SystemClock.beats, newTime.beats); };);
)