#!/bin/bash
#
# --- Version 0.2 ---
# 
# This is TN. github@nakouchdoge/scripts
#
DIR="$(dirname "$0")"

. "$DIR"/functions/base.sh
. "$DIR"/functions/00-misc.sh
. "$DIR"/functions/10-packages.sh
. "$DIR"/functions/20-bash.sh
. "$DIR"/functions/30-ssh.sh
. "$DIR"/functions/40-firewall.sh

red=$'\e[31m'
purple=$'\e[35m'
green=$'\e[32m'
grey=$'\e[90m'
cr=$'\e[0m'

welcomeMessage

function main {
	PS3="${green}:: Make a selection (Press ENTER to see options): ${cr}"
	userChoices=(
		"Run the whole script!" 
		"Change Hostname"
		"Install Packages" 
		"Add bash prompt/timeout" 
		"Modify SSH" 
		"Modify Firewall" 
		"Install NeoVIM Config" 
		"Quit"
	)
	select userSelection in "${userChoices[@]}"; do
		case $userSelection in
			"Run the whole script!")
				changeHostname
				installDocker
				installPackages
				detectPackagesInstalled
				bashPrompt
				bashTimeout
				sshAuthorizedKeys
				sshPortChange
				sshSecurity
				sshService
				detectUfw
				enableUfw
				nvimConfig
				nvimEnsureConfig
				;;
			"Change Hostname")
				changeHostname
				;;
			"Install Packages")
				installPackages
				installDocker
				detectPackagesInstalled
				;;
			"Add bash prompt/timeout")
				bashPrompt
				bashTimeout
				;;
			"Modify SSH")
				sshAuthorizedKeys
				sshPortChange
				sshSecurity
				sshService
				;;
			"Modify Firewall")
				detectUfw
				enableUfw
				;;
			"Install NeoVIM Config")
				nvimConfig
				nvimEnsureConfig
				;;
			"Quit")
				break
				;;
			*)
				echo "${red}Invalid Option.${cr}"
				;;
		esac
	done
}

main

echo "::"
echo "${red}****END OF SCRIPT****${cr}"
echo "::"

exit