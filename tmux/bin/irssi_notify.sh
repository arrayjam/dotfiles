#!/bin/sh

irssi_notifier() {
	ssh yurifury@echelon.nexiom.net 'echo -n "" > ~/.irssi/fnotify; tail -f ~/.irssi/fnotify' | \
		while read heading message; do
			url=`echo \"$message\" | grep -Eo 'https?://[^ >]+' | head -1`;

			if [ ! "$url" ]; then
				terminal-notifier -title "\"$heading\"" -message "\"$message\"" -activate com.apple.Terminal;
			else
				terminal-notifier -title "\"$heading\"" -message "\"$message\"" -open "\"$url\"";
			fi;
		done
	}

irssi_notifier
