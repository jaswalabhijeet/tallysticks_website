#!/usr/bin/env bash

coffee -cw js/app.coffee &
bundle exec guard
