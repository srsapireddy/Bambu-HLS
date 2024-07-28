long func(int,int,int,int);
main()
{
	int j;
	int k;
	
	int c;
	int d;
	
	int res = func(j,k,c,d);
	return 0;
}

long func(int j, int k, int c, int d)
{
	int i = 0;
	if(c > 2){
		i = j - k;
	} else if (d < 5) {
		i = j + k;
	} else {
		i = 12;
	}
return i;
}
