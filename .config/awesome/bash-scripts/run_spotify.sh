#!/bin/bash
pgrep -x spotify >/dev/null && echo "Process found" || spotify
