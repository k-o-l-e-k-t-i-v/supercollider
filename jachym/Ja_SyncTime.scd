(
var sysTime, syncTime, newTime;
sysTime = SystemClock.beats;
postf("\nCurrent system time is %\nINT --- next (int)sysTime is %\n", sysTime, sysTime.ceil) ;

syncTime = sysTime%1;
postf("PING --- time to sync is %\n\n", syncTime);

newTime = TempoClock(1,0,syncTime+sysTime.ceil-1);
postf("SystemTime : %\nNewTime : %\n", SystemClock.beats, newTime.beats);

newTime.sched(1, { postf("\n2ndTry\nSystemTime : %\nNewTime : %\n", SystemClock.beats, newTime.beats); };);
)