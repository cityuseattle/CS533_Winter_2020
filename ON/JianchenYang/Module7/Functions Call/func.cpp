#include <iostream>
using namespace std;

void fourth(){
}

void third(){
    fourth();
}

void second(){
    third();
}

void first(){
    second();
}

int main(){
    first();

    int x = 20;
    cout << x;

    return 0;
}