# Iguazu

[![Build Status](https://secure.travis-ci.org/rurounijones/iguazu.png)](http://travis-ci.org/rurounijones/iguazu)
[![Dependency Status](https://gemnasium.com/rurounijones/iguazu.png)](https://gemnasium.com/rurounijones/iguazu)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/rurounijones/iguazu)

## What?

Dropbox managed Ruby On Rails (Or maybe Sinatra; I haven't yet decided)
Photo-Gallery site.

## Why?

A few reasons:

9. Give my mother an easy way to create and manage her own photo-gallery site
   without leaving the desktop paradigm she is used to. (Look, big words!)

9. Try and create a ruby web-app that
   [Uncle Bob](http://confreaks.com/videos/759-rubymidwest2011-keynote-architecture-the-lost-years "'Architecture, the lost years' Presentation")
   and [Jim Gay](http:http://clean-ruby.com/ "'Clean Ruby' Book homepage")
   would not kill me for making.

## Status

Exceedingly early state, totally non-functional, this is not the ready-to-go
site you are looking for.

## Install

Iguazu uses environment variables to store information needed to connect to 
dropbox. 

The 4 environment variables are DROPBOX_APP_KEY DROPBOX_APP_SECRET 
DROPBOX_TOKEN DROPBOX_SECRET

You can set them using

    export DROPBOX_APP_KEY=dummy_data
    export DROPBOX_APP_SECRET=dummy_data

    export DROPBOX_TOKEN=dummy_data
    export DROPBOX_SECRET=dummy_data

on Linux and Mac or

    set DROPBOX_APP_KEY=dummy_data 
    set DROPBOX_APP_SECRET=dummy_data 

    set DROPBOX_TOKEN=dummy_data 
    set DROPBOX_SECRET=dummy_data 

on Windows.

## Development

Running tests currently requires the environment variables mentioned in 
the install section to be set. They do not have to have correct values 
however so feel free to copy and paste the above dummy values.
