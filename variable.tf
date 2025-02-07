variable "webuser" {
  default = "ubuntu"
}
variable "my_ip" {
  default = ["xxx.xxx.xx.xxx/xx"] #give your IP Addr
}
variable "all_traffic" {
  default = ["0.0.0.0/0"]
}
variable "region" {
  default = "us-east-1"
}