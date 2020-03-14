#include <iostream>
using namespace std;

int subTwo(int a, int b)
{
    int sub = a - b;
    return sub;
}

int dosomething(int x, int y)
{
    int a = subTwo(x, y);
    int b = subTwo(y, x);
    return a + b;

}

int main()
{
    int x = 20;
    int y = 10;
    int val;

    val = dosomething(x, y);

    cout << val;

    return 0;
}