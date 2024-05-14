BEGIN{
sum=0;
}
{
	if($1>0)
	printf("%d\t%f\n",$1,sum/$1);
	sum=sum+$2
	}
END {
	puts "Done"
}
