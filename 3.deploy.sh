gcloud builds submit --tag eu.gcr.io/$PROJECT/$"$NAME-service"

gcloud run deploy "$NAME-service" --image eu.gcr.io/$PROJECT/"$NAME-service" \
  --platform managed --project $PROJECT --region $REGION --allow-unauthenticated