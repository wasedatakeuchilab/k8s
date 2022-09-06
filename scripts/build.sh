#! /bin/bash

builddir="build"
appdir="apps"
for appname in $(ls $appdir); do
    outputdir=$builddir/$appname
    if [ ! -d $outputdir ]; then
        mkdir -p $outputdir
    fi
    if [ -d $appdir/$appname/base ]; then
        kubectl kustomize $appdir/$appname/base -o $outputdir/base.yml
    fi
    overlaydir=$appdir/$appname/overlays
    if [ -d $overlaydir ]; then
        for overlay in $(ls $overlaydir); do
            kubectl kustomize $overlaydir/$overlay -o $outputdir/$overlay.yml
        done
    fi
done
