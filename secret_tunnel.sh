#!/bin/sh
cd -- "$(dirname "$BASH_SOURCE")"
ALPHA_IP="54.243.148.13"
BETA_IP="52.203.76.119"
GAMMA_IP="44.206.221.84"
DELTA_IP="44.207.17.207"


while :
do
	echo "1: Alpha (54.243.148.13)"
	echo "2: Beta  (52.203.76.119)"
	echo "3: Gamma (44.206.221.84)"
	echo "4: Delta (44.207.17.207)"
	read -p "Enter the number of the EC2 instance you wish to connect to or enter the full IP address you want to connect to: " varinstance

	case $varinstance in
		1)
			SELECTED_IP=$ALPHA_IP
			break
			;;

		2)
			SELECTED_IP=$BETA_IP
			break
			;;

		3)
			SELECTED_IP=$GAMMA_IP
			break
			;;

		4)
			SELECTED_IP=$DELTA_IP
			break
			;;

		*)
			SELECTED_IP=$varinstance
			break
			;;

	esac
done

echo "Connecting to $SELECTED_IP"

ssh -L 5901:localhost:5901 -i chilicon-p2p-support.pem ec2-user@${SELECTED_IP} -tt &
env VNC_PASSWORD="chilicon" TigerVNC\ Viewer\ 1.11.0.app/Contents/MacOS/TigerVNC\ Viewer localhost:5901