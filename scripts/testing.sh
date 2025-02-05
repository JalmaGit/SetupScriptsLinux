my_first_arg="$1"
my_second_arg="$2"

echo "Argument one is: $my_first_arg"
echo "Argument two is: $my_second_arg"

if [ "$my_first_arg" = "1" ]; then
    echo "worked: $1"
else
    echo "Did not work"
fi