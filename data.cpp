# include <cstdlib>
# include <iostream>
using namespace std;

# include "data.hpp"

void change_data( int npts, double vec[] )
{

    for (int i = 0; i < npts; i++)
    {
        vec[i] = vec[i] * 2.0;
    }

    return;

}
