variable "ingress-rules" {
  type = list(
    object({
      name          = string
      protocol      = string
      ports         = list(string)
      target-svcs   = list(string)
      source-ranges = list(string)
    })
  )
}
variable "egress-rules" {
  type = list(
    object({
      name          = string
      protocol      = string
      ports         = list(string)
      target-svcs   = list(string)
      source-ranges = list(string)
    })
  )
}
