#!/bin/bash

/mnt/partage/src/iftun &
ip -6 address add fc00:1234:ffff::1/64 dev tun0
