(
s.waitForBoot({
    ~audioBuffer = Buffer.cueSoundFile(s, "/tmp/01.raw", 0, numChannels: 1);
});
)
s.reboot;



p = ProxySpace.push(s);
