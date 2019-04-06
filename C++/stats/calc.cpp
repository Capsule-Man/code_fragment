#include <iostream>
#include <iterator>

#include "Eigen/Dense"

#include <boost/accumulators/accumulators.hpp>
#include <boost/accumulators/statistics.hpp>

using namespace boost::accumulators;

void calc_with_boost_stats()
{
    std::vector<int> vec = {1, 2, 3};
    accumulator_set<double, stats<tag::min>> acc;
    acc = std::for_each(vec.begin(), vec.end(), acc);
    std::cout << extract::min(acc) << std::endl;
}

void calc_with_eigen_first() {

    Eigen::ArrayXf arr(5);
    for(int x = 0; x < 5; x++){
        arr(x) = static_cast<float>(x);
    }

    std::cout << arr.sum() << std::endl;
    std::cout << arr.mean() << std::endl;
    std::cout << arr.maxCoeff() << std::endl;
    std::cout << arr.minCoeff() << std::endl;

}

void calc_with_eigen_second() {

    Eigen::ArrayXXf arr1(3, 3);
    Eigen::ArrayXXf arr2(3, 3);

    arr1 << 1, 2, 3,
            4, 5, 6,
            7, 8, 9;
    arr2 << 9, 8, 7,
            6, 5, 4,
            3, 2, 1;

    std::cout << arr1 + arr2 << std::endl;
    std::cout << arr1 - arr2 << std::endl;
    std::cout << arr1 * arr2 << std::endl;
    std::cout << arr1 / arr2 << std::endl;

}

int main() {
    calc_with_eigen_second();
}