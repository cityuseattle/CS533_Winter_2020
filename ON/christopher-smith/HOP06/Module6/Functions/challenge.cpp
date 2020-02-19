# include <iostream>
using namespace std;

int Fibonacci (int n) {
    int a=0;
    int b=1;
    int c;

    if (n==0) {
        return 0;
    }

    else if (n==1) {
        return 1;
    }

    else {
            for (int i=0;i<=n-2;i++) {
             c=a+b;
             a=b;
             b=c;
        }

        return c;
    }

}

int main(){
    int n=16;
    int val;

    val=Fibonacci(n);

    cout<<"The answer is: "<<val;

    return 0;
}
