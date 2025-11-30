S3 module

Inputs:
- bucket_name (string) - required
- region (string) - default us-east-1
- tags (map) - default {}
- force_destroy (bool) - default false

Outputs:
- bucket_id
- bucket_arn

This module creates an S3 bucket with server-side encryption, versioning, lifecycle rule, and a public access block.
