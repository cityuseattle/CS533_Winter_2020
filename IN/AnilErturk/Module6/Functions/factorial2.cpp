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
	int n = 6;
	int val;
	int m;

	val = fact(n);
	m = fact(7);
	std::cout << val << '\n' << m;
}
