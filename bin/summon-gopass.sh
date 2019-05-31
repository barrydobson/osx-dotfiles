#!/usr/bin/env bash

ARGS=$(echo $1| tr : \ )
gopass ${ARGS}
