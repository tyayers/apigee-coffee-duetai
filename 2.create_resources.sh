gcloud iam service-accounts create "$NAME-service" \
    --description="Service account to manage $NAME resources" \
    --display-name="$NAME Service"

gcloud projects add-iam-policy-binding $PROJECT \
    --member="serviceAccount:$NAME-service@$PROJECT.iam.gserviceaccount.com" \
    --role="roles/run.invoker"
