#include <numeric>
#include <iostream>
#include "checker.h"


bool check_sum(std::vector<double> const & vec, double threshold){
    const double result = std::accumulate(vec.begin(), vec.end(), 0.0);
    return result > threshold;
}

bool check_avg(std::vector<double> const & vec, double threshold){
    // これで結果が変わってしまう!!
    // const double result = std::accumulate(vec.begin(), vec.end(), 0) / std::size(vec);
    const double result = std::accumulate(vec.begin(), vec.end(), 0.0) / std::size(vec);
    std::cout << result << std::endl;
    return result > threshold;
}

int main() {
    std::vector<double> v = {1, 2, 3, 4};
    auto const & r = v;
    if (check_avg(r, 2)) {
        std::cout << "BUY!!" << std::endl;
    }
    else {
        std::cout << "WAIT!!" << std::endl;
    }
}