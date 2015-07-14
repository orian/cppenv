#
git clone https://github.com/orian/psz_utils && cd psz_utils && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX:PATH=/libs /src && make all install

# failes with :ro
cmake -DCMAKE_BUILD_TYPE=Release -DJSONCPP_LIB_BUILD_SHARED=ON -DCMAKE_INSTALL_PREFIX:PATH=/libs -G "Unix Makefiles" /src && mv /libs/include/json /libs/include/jsoncpp/json

