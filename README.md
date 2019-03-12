# adstop

adstop is a small bash script that will fetch several other publicated ad and tracker servers and generate a hosts file containing them for blacklisting. Basically it just creates entries like:

```
0.0.0.0 ad.domain.tld
0.0.0.0 tracker.domain.tld
```

## How to use

The most basic version is just to download the script and the `adstop.tpl` file, put them into the same directory and run it.

The script will then use the blocklists in the tpl file, generate a hosts file and copy it into the same location where you run it.

However, instead of just running it like that, you can copy the `adstop.tpl` file to `adstop.conf`.

Then you can modify the blocklists in the `adstop.conf` file by either adding more or removing some.

You can also give custom entries that should appear at the top or bottom of your hosts files

And with the `finalize` function at the top of the `adblock.tpl` file you can even say what commands should be run after it generated the hosts file in a temporary directory.
