#!/bin/bash

npm run docs:build
export AWS_PROFILE="datallogdns"  # Change this if you use a different AWS profile
S3_BUCKET_NAME="docs-datallog-com"
CLOUDFRONT_DISTRIBUTION_ID="E3F1ZWBMVUWXSY"
SOURCE_DIR="./docs/.vitepress/dist"

aws s3 sync "${SOURCE_DIR}" "s3://${S3_BUCKET_NAME}/" --profile "${AWS_PROFILE}" --delete

if [ $? -ne 0 ]; then
  echo "--------------------------------------------------"
  echo "Error: S3 sync failed. Aborting deployment." >&2
  exit 1
fi

echo "S3 upload complete."
echo "--------------------------------------------------"

echo "Invalidating CloudFront cache for distribution: ${CLOUDFRONT_DISTRIBUTION_ID}..."
aws cloudfront create-invalidation \
  --distribution-id "${CLOUDFRONT_DISTRIBUTION_ID}" \
  --profile "${AWS_PROFILE}" \
  --paths "/*"
# Check if the CloudFront invalidation was successful.
if [ $? -ne 0 ]; then
  echo "--------------------------------------------------"
  echo "Error: CloudFront invalidation failed." >&2
  exit 1
fi

echo "CloudFront invalidation created successfully."
echo "--------------------------------------------------"
echo "Deployment complete!"
