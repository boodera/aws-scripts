EXTRACTIP=$(curl v4.ifconfig.co)

if [ -z "$EXTRACTIP" ]
then
        echo "You are not connected to the internet."
        exit 1
else
        IPADDRESS=$EXTRACTIP/32
fi
REGION_ID="ap-southeast-1"
GROUP_ID="sg-aabbccdd"

aws ec2 update-security-group-rule-descriptions-ingress --region $REGION_ID --group-id $GROUP_ID --ip-permissions '[{"IpProtocol": "ssh", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": \""$IPADDRESS"\", "Description": "SSH access from My home"}]}]'
