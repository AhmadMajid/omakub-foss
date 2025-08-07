#!/bin/bash

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			# Skip if app name contains usage text or invalid characters
			if [[ "$app" =~ usage.*gum || "$app" =~ \[.*\] || "$app" =~ \<.*\> ]]; then
				echo "Skipping invalid app name: $app"
				continue
			fi

			app_file="$OMAKUB_PATH/install/desktop/optional/app-${app,,}.sh"
			if [[ -f "$app_file" ]]; then
				source "$app_file"
			else
				echo "Warning: Optional app installer not found: $app_file"
			fi
		done
	fi
fi
