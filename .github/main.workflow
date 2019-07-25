workflow "Continuous Integration (CI)" {
  on = "push"
  resolves = [
    "build",
    "lint",
    "phpcs",
    "phpstan",
    "phpunit",
  ]
}

action "build" {
  uses = "actions/docker/cli@master"
  args = "build --target ci ."
}

action "lint" {
  uses = "actions/docker/cli@master"
  args = "build --target lint ."
  needs = ["build"]
}

action "phpcs" {
  uses = "actions/docker/cli@master"
  args = "build --target phpcs ."
  needs = ["build"]
}

action "phpstan" {
  uses = "actions/docker/cli@master"
  args = "build --target phpstan ."
  needs = ["build"]
}

action "phpunit" {
  uses = "actions/docker/cli@master"
  args = "build --target phpunit ."
  needs = ["build"]
}
