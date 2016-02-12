#!/bin/bash
find . -name '*.scd' -size -2000c -print0 | xargs -0 rm
