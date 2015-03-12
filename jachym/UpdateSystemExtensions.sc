UpdateSystemExtensions
{
	var systemDir, libDir;

	*new { |projectPath|
		^super.new.init(projectPath);
	}

	init { |path|
		projectDir = Document.current;
		systemPath = Platform.systemExtensionDir;
	}

	projectDir(path)
	{
		// Document.current.path
	}

	readSourcePaths{
		//read all files from project dir (gitFolder)
	}

	checkExistingPaths{
		//read all files from Platform.systemExtensionDir and compare needs to copy
	}

	copy{
		// copy files
	}

	rebootLibrary{
		// reload system extensions library and reboot server
	}

	print{

	}

	update{
		// main method
	}
}