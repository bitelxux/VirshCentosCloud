#!/bin/sh
genisoimage -o ./cloud-init.iso -V cidata -r -J meta-data user-data
