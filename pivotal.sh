#!/bin/bash

while getopts ":d:a" opt; do
  case $opt in
    d)
		/usr/bin/env ruby /Users/rs/rt/pivotal_accepted.rb 2>&1
		echo "-d was triggered!" >&2
		;;
    a)
		/usr/bin/env ruby /Users/rs/rt/pivotal_pull_active.rb 2>&1
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

