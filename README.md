# adstop

adstop is a small bash script that will fetch several other publicated ad and tracker servers and generates a `hosts` as well as two `dnsmasq` config files containing those entries for blacklisting. Basically it just creates entries like:

```
0.0.0.0 ad.domain.tld
0.0.0.0 tracker.domain.tld
```

or in the case of dnsmasq entries will be like

```
address=/somedomain.tld/0.0.0.0
address=/otherdomain.tld/0.0.0.0
```

Since `dnsmasq` also applies a rule for `domain.tld` to `sub.domain.tld`, the `dnsmasq` configuration files are shorted compared to the `hosts` file. Some special measures are taken so that popular domains won't get blocked as it would be case for `pixel.facebook.com` or `adservice.google.com` which would without measures block all of `facebook.com` and `google.com`

## How to use

The most basic version is just to download the script and the `adstop.tpl` file, put them into the same directory and run it.

The script will then use the blocklists in the tpl file, generate the hosts and dnsmasq files and copy them into the same location where you run it.

However, instead of just running it like that, you can copy the `adstop.tpl` file to `adstop.conf`.

Then you can modify the blocklists in the `adstop.conf` file by either adding more or removing some.

You can also give custom entries that should appear at the top or bottom of your hosts files and set custom filters for domains that should not be shortened.

And with the `finalize` function at the top of the `adblock.tpl` file you can even say what commands should be run after it generated the hosts file in a temporary directory.

There are two `dnsmasq` configuration files being created. One contains IDN domains and the other one has filtered them out, since support of IDN in dnsmasq is dependant on how it was compiled.