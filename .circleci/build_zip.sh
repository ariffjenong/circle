#!/bin/bash
cd ~/znxt

com ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1


#echo "$rclone_config" > ~/.config/rclone/rclone.conf
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Uploading ccache...."
time rclone copy ccache.tar.gz znxtproject:ccache/$ROM_PROJECT -P
#cd ~
#time com rom 1
ls -lh
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Uploading Success"
