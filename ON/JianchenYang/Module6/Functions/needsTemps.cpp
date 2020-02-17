#include <iostream>

using namespace std;

int needsTemps(int x, int y) {
    int add = x + y;
    int sub = x - y;
    int mult = add * sub;
    return mult;
}

int main() {
    int x = 10;
    int y = 8;
    int val;

    val = needsTemps(x,y);

    cout << val;
    
    return 0;
}