#!/bin/bash
apt -o Acquire::ForceIPv4=true update
apt -o Acquire::ForceIPv4=true install -y netcat-openbsd
