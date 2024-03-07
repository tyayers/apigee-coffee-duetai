GET http://localhost:8998/httpbin2/get
x-app: MY_APP
HTTP 401
[Asserts]
header "X-Apigee-organization" exists
header "X-Apigee-organization" contains "hybrid"

GET http://localhost:8998/httpbin2/get?apikey=38xu1h3QUugsEe4ctIsrhYcpPYnkrJcY
x-app: MY_APP
HTTP 200
[Asserts]
header "X-Apigee-organization" exists
header "X-Apigee-organization" contains "hybrid"
jsonpath "$.headers.Host" == "httpbin.org"

GET http://localhost:8998/coffeeservice/coffee-beans
HTTP 201
[Asserts]
jsonpath "$" count == 3