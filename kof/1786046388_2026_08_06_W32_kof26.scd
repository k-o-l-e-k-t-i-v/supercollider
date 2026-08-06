(
// Spawn the external raw sound generator/processor piping f32le to stdout
var cmd = "cat /tmp/01.raw"; // Or your custom binary name
var pipe = Pipe.new(cmd, "r");
var floatArray, bytesRead;

if (pipe.notNil) {
    // Read raw data or process line-by-line depending on how data is structured.
    // For raw binary streaming, you read chunks of bytes/floats:
    
    ("Pipe opened successfully.").postln;
    
    // Always remember to explicitly close the pipe when finished to prevent leaks
    pipe.close();
} {
    "Failed to open pipe.".warn;
};
)
