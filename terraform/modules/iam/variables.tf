variable "github_owner" {
  description = "GitHub owner/org or user"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo name (optional). If omitted, trust all repos in org when using `sub` pattern. Use with care."
  type        = string
  default     = ""
}

variable "role_name" {
  description = "IAM role name to create for GitHub Actions to assume"
  type        = string
}

variable "aud" {
  description = "Audience used in the OIDC token (usually sts.amazonaws.com)"
  type        = string
  default     = "sts.amazonaws.com"
}

variable "policy_json" {
  description = "Policy JSON to attach (string)"
  type        = string
  default     = ""
}
