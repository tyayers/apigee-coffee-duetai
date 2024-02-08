GET  http://localhost:8998/httpbin2/get
x-app: MY_APP
HTTP 401
[Asserts]
header "X-Apigee-organization" exists
header "X-Apigee-organization" contains "hybrid"

GET  http://localhost:8998/httpbin2/get?apikey=FB5HoB0dYjqFqwe7fMAW2oOZtw3p56NF
x-app: MY_APP
HTTP 200
[Asserts]
header "X-Apigee-organization" exists
header "X-Apigee-organization" contains "hybrid"
jsonpath "$.headers.Host" == "httpbin.org"