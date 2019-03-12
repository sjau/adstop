#!/usr/bin/env bash

# Copy this file to adstop.conf and modfify the blocklists to your liking.
# If adblocker.conf doesn't exist, then the default one here will be used.
# Check https://firebog.net/ for blocklists

# Finalize - this command will be run at the very end of the script. Use it to move/copy the generated hosts somewhere or do other magic
# The variable ${curPath} contains the current path to the adstop script
# The variable ${tmpStorage} contains the path to the temporary path and the hosts file would be "${tmpStorage}/hosts"
finalize() {
    cp "${tmpStorage}/hosts" "${curPath}/hosts"
}


# Create array of block lists have format:
# 127.0.0.1 domain.tld
localList=( 
    "https://adaway.org/hosts.txt"
    "https://hosts-file.net/ad_servers.txt"
    "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
)



# Create array of block lists that just contain domain.tld without ip
domainList=(
    "https://v.firebog.net/hosts/AdguardDNS.txt"
    "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
    "https://v.firebog.net/hosts/Easylist.txt"
    "https://www.squidblacklist.org/downloads/dg-ads.acl"
    "https://v.firebog.net/hosts/Easyprivacy.txt"
    "https://v.firebog.net/hosts/Prigent-Ads.txt"
    "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt"
    "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt"
    "https://v.firebog.net/hosts/Airelle-trc.txt"
    "https://blocklist.kowabit.de/list.txt"
)



# Create array of block lists that have format:
# 0.0.0.0 domain.tld
zeroList=(
    "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/UncheckyAds/hosts"
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.2o7Net/hosts"
    "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
)



# Entries here will be added to the top of the generated hosts file
customTop=""



# Entries here will be added at the bottom of the generated hosts file
customBottom=""
