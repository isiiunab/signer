#!/bin/bash


cd $HOME
git clone  https://github.com/jmarxuach/BatchPDFSign.git
cd BatchPDFSign/
mvn clean package
cp portable/target/BatchPDFSignPortable.jar /vagrant 
