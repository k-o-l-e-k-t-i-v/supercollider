#!/bin/bash
find . -name '*.scd' -size 0 -print0 | xargs -0 rm
