#include <iostream>

int fact(int n)
{
	int v = 1;

	if (n == 0)
		return v;

	for (int i = 1; i <= n; i++)
		v = v * i;

	return v;
}

int main()
{
	int n;
	int val;

	std::cout << "Enter an integer: ";
	std::cin >> n;

	val = fact(n);
	std::cout << val;
}
