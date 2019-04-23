#Epicor user name
$user = "epicor"
#Epicor Password
$pass= "epicor"


#BAQ End point URL
$uri = "https://YourEpicorServer.TLD/EpicorProduction/api/v1/BaqSvc/zCustomer01/"

#Create encoded password
$secpasswd = ConvertTo-SecureString $pass -AsPlainText -Force

#Create Credential
$cred = New-Object System.Management.Automation.PSCredential ($user, $secpasswd)

#Rest Call
$data = Invoke-RestMethod $uri -Method Get -Credential $cred -ContentType "Applicatin/Json"

#Dump results as CSV
$data.value | Export-Csv -Path './test.csv' -NoTypeInformation
