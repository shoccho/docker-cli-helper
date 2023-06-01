## This is a very basic docker cli helper script 

I've found myslef trying to delete containers and images a lot and some times I want to delete all the containers or images that I have created from failed attempts at making a --decent-- working docker file. Every time chaining docker ps -a and remembering awk syntax was very awkward ;) henceforth I wrote this script on a whim. Warning this might not be useful at all to you, it's almost useless to me most of the time and I'll probably forget that this exists in near future. 

### How to run

Just run the `bash ./dock.sh` from the project directory 

you can try running the tests by running `make test`

you can also try to install this as a system tool by running `make install` ( you'll most likely need sudo for this )
