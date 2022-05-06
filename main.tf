provider "aws" {
  region = var.region
}

resource "aws_iam_group" "group" {
  name = var.name
  path = "/"
}

resource "aws_iam_group_membership" "members" {
  name = "${var.name}-membership"

  users = var.members

  group = aws_iam_group.group.name
}

resource "aws_iam_group_policy" "policy" {
  name  = "${var.name}-policy"
  group = aws_iam_group.group.name

  policy = file("json/iam_groups/${var.name}.json")
}