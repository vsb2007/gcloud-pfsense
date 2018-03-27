#!/bin/sh

#curl https://nyifiles.pfsense.org/mirror/downloads/pfSense-CE-memstick-serial-2.4.2-RELEASE-amd64.img.gz | gunzip > disk.raw
curl https://snapshots.pfsense.org/amd64/pfSense_RELENG_2_4_3/installer/pfSense-CE-memstick-serial-2.4.3-RC-amd64-latest.img.gz | gunzip > disk.raw

tar -Sczf pfSense-CE-memstick-serial-2.4.3-Latest-amd64.img.tar.gz disk.raw

gsutil cp pfSense-CE-memstick-serial-2.4.3-Latest-amd64.img.tar.gz gs://mydisk-1

