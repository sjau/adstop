#!/usr/bin/env bash

# Copy this file to adstop.conf and modfify the blocklists to your liking.
# If adblocker.conf doesn't exist, then the default one here will be used.
# Check https://firebog.net/ for blocklists

# Finalize - this command will be run at the very end of the script. Use it to move/copy the generated hosts somewhere or do other magic
# The variable ${curPath} contains the current path to the adstop script
# The variable ${tmpStorage} contains the path to the temporary path and the hosts file would be "${tmpStorage}/hosts"
finalize() {
    cp "${tmpStorage}/hosts" "${curPath}/hosts"
    cp "${tmpStorage}/dnsmasq" "${curPath}/dnsmasq"
    cp "${tmpStorage}/dnsmasqIDN" "${curPath}/dnsmasqIDN"
    cd "${curPath}" || exit
    git add -A
    git commit -am "Update"
    git push
}


# Create array of block lists have format:
# 127.0.0.1 domain.tld
localList=( 
    "https://adaway.org/hosts.txt"
    "https://hosts-file.net/ad_servers.txt"
    "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
    "http://www.malwaredomainlist.com/hostslist/hosts.txt"
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
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts"
    "https://someonewhocares.org/hosts/zero/"
    "http://winhelp2002.mvps.org/hosts.txt"
    "https://github.com/AdroitAdorKhan/Energized/blob/master/core/hosts"
    "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt"
)



# Entries here will be added to the top of the generated hosts file
hostsTop=""



# Entries here will be added at the bottom of the generated hosts file
hostsBottom=""



# Entries matching the string here will be removed from the generated hosts file
hostsRemove=(
    "thetvdb"
)


# Entries here will be added to the top of the generated dnsmasq config file
dnsmasqTop=""



# Entries here will be added at the bottom of the generated dnsmasq config file
dnsmasqBottom=""



# Array elements here will not be shortened to the domain name. This can be useful that
# you might want to block the pixel tracking of facebook "pixel.facebook.com" but not "facebook.com" in general
# Notice: In addition the top 500 domains ( https://moz.com/top500/domains/csv ) will also be extempted by default
dnsmasqIgnore=(
    "google"
    "facebook"
    "github"
)



# Entries matching the string here will be removed from the generated dnsmasq file
dnsmasqRemove=(
    "thetvdb"
)
