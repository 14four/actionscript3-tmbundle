#!/bin/bash

defaultProjectName="FlashProject.tmproj";
defaultClassPath="${TM_DEFAULT_CLASS_PATH:-com}";

fullProjectPath=$(CocoaDialog filesave \
			--text "Please name your project and select a folder to save it into" \
			--title "Create New Project" \
			--with-extensions .tmproj \
			--with-file "$defaultProjectName");

if [ -n "$fullProjectPath" ]; then
	
	fullProjectPath=$(tail -n1 <<<"$fullProjectPath");
	projectName=`basename "$fullProjectPath" ".tmproj"`;
	projectPath=`dirname "$fullProjectPath"`;
	
	# Now ask what the class path should be, used to create default dirs.
	fullClassPath=$(CocoaDialog standard-inputbox \
				--title "Project Class Path" \
				--text "$defaultClassPath.$projectName" \
				--informative-text "Enter the project class path:");
	
	if [ -n "$fullClassPath" ]; then
		originalClassPath=$(tail -n1 <<<"$fullClassPath");
		classPath=`echo $originalClassPath | tr '.' '/'`;
		classPathDirectory="$projectPath/$projectName/source/classes/$classPath/";
		
		# Create our project directory structure.
		mkdir -p "$projectPath/$projectName/deploy/xml";
		mkdir -p "$projectPath/$projectName/deploy/css";
		mkdir -p "$projectPath/$projectName/deploy/swf";
		mkdir -p "$projectPath/$projectName/deploy/js";
		
		#Create the ClassPath Directory 
		mkdir -p "$classPathDirectory";
				
		# Gather variables to be substituted.
		TM_NEW_FILE_BASENAME="$projectName";
		export TM_FILE_PACKAGE="$originalClassPath";
		export TM_FILE_PACKAGE_DIRECTORY="source/classes/$classPath/";
		
		export TM_YEAR=`date "+%Y"`;
		export TM_DATE=`date "+%d.%m.%Y"`;

		export TM_FLASH_VERSION = '${TM_PLAYER_VERSION:-9.0}';
		
		# Customise file variables for the new project and rename
		# files to match the project name.
		perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "Project.tmproj.xml" > "$projectPath/$projectName/$projectName.tmproj";
		perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "Project.as" > "$projectPath/$projectName/source/classes/$classPath/$projectName.as";
		perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "Project.fla" > "$projectPath/$projectName/source/$projectName.fla";
		perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "index.html" > "$projectPath/$projectName/deploy/index.html";
		perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "Project-config.xml" > "$projectPath/$projectName/deploy/xml/$projectName-config.xml";

		# Copy static files.		
		cp "main.css" "$projectPath/$projectName/deploy/css/main.css";
		cp "swfaddress.js" "$projectPath/$projectName/deploy/js/swfaddress.js";
		cp "swfobject.js" "$projectPath/$projectName/deploy/js/swfobject.js";
		
		# Open the project in TextMate.
		open -a "TextMate.app" "$projectPath/$projectName/$projectName.tmproj";
		
	fi

fi