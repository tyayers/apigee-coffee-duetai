vacuum html-report ../specs/openapi_spec_apigee.yaml reports/spec_coffee_report.html

apigeelint -s ../src/main/apigee/apiproxies/CoffeePurchasing-v1/apiproxy -f html.js -w reports/apigeelint_coffee_report.html --profile apigeex
apigeelint -s ../src/main/apigee/apiproxies/AK-authentication-proxy/apiproxy -f html.js -w reports/apigeelint_httpbin_report.html --profile apigeex