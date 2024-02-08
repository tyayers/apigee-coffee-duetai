cd ../src/main/apigee/apiproxies/AK-authentication-proxy
zip -r AK-authentication-proxy.zip apiproxy

token=$(gcloud auth print-access-token)
apigeecli apis import -t $token -o apigee-test38 -f .
apigeecli apis deploy -t $token -e eval -n AK-authentication-proxy -o apigee-test38 -r

rm AK-authentication-proxy.zip