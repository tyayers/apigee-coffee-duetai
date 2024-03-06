GET https://api.34-110-134-67.nip.io/httpbin2/get
x-app: MY_APP
HTTP 401
[Asserts]
header "content-type" exists
header "content-type" contains "application/json"
