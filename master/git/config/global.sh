#!/bin/sh

git config --global http.postBuffer 2048M
git config --global http.maxRequestBuffer 1024M
git config --global core.compression 9

git config --global ssh.postBuffer 2048M
git config --global ssh.maxRequestBuffer 1024M

git config --global pack.windowMemory 256m 
git config --global pack.packSizeLimit 256m
