#include <iostream>
#include <cmath>
#include <chrono>
#include <omp.h>


double est_pi(int num) {

    // https://qiita.com/hanada/items/c91788bcac2a40f1bb05#cより

    double s = 0.0;
    #pragma omp parallel for reduction(+:s) num_threads(num)
    for(int n = 0; n <= 100000000; n++){
        s += std::pow(-1, n) / (2.0 * n + 1.0);
    }
    return s*4;
}

int main()
{

    std::cout << "GET_NUM_THREADS: " << omp_get_num_threads() << std::endl;
    std::cout << "GET_MAX_THREADS: " << omp_get_max_threads() << std::endl;

    auto start = std::chrono::system_clock::now();

    std::cout << est_pi(4) << std::endl;

    auto end = std::chrono::system_clock::now();
    auto dur = end - start;
    auto msec = std::chrono::duration_cast<std::chrono::milliseconds>(dur).count();
    std::cout << msec << " msec \n";

}
