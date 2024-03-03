#!/bin/bash

echo extracting 200M of entropy

head -c 200M /dev/urandom | split -b 20M

echo compressing all 20MB chunks of entropy using all the threads

tar -c --use-compress-program=pigz -f xaa.tar.gz xaa &
tar -c --use-compress-program=pigz -f xab.tar.gz xab &
tar -c --use-compress-program=pigz -f xac.tar.gz xac &
tar -c --use-compress-program=pigz -f xad.tar.gz xad &
tar -c --use-compress-program=pigz -f xae.tar.gz xae &
tar -c --use-compress-program=pigz -f xaf.tar.gz xaf &
tar -c --use-compress-program=pigz -f xag.tar.gz xag &
tar -c --use-compress-program=pigz -f xah.tar.gz xah &
tar -c --use-compress-program=pigz -f xai.tar.gz xai &
tar -c --use-compress-program=pigz -f xaj.tar.gz xaj &
tar -c --use-compress-program=pigz -f xak.tar.gz xak &
tar -c --use-compress-program=pigz -f xal.tar.gz xal &
tar -c --use-compress-program=pigz -f xam.tar.gz xam &
tar -c --use-compress-program=pigz -f xan.tar.gz xan &
tar -c --use-compress-program=pigz -f xao.tar.gz xao &
tar -c --use-compress-program=pigz -f xap.tar.gz xap &
tar -c --use-compress-program=pigz -f xaq.tar.gz xaq &
tar -c --use-compress-program=pigz -f xar.tar.gz xar &
tar -c --use-compress-program=pigz -f xas.tar.gz xas
tar -c --use-compress-program=pigz -f xat.tar.gz xat

echo done

ls x* -la
