f = open("out.txt", "r")
str_data = f.read()
f.close()
list1 = input("Enter all values: ").split()

for i in list1:
    if i in str_data:
        count = str_data.count(i)
        print(f'there are {count} {i} in packet')
    else:
        print(f'there is no {i} in packet')
