## Dependabot/Renovatebot alerts have being disabled on this repo to reduce emails

But you are still welcome to re-enable it if you want to make more testints! To do so, please follow the instructions:
1. Fork this repo and make the tests on the fork. It will reduce unwanted email to the owner of this repo.
2. Enable dependabot by changing `/.github/dependabot.json` and setting the `open-pull-requests-limit` to a value different than zero (or commenting that line)
2. Enable renovatebot by changing `/renovate.json` and set `enabled` to `true`
---
# testing-dependabot
Repository created to test if dependabot or renovabot can update hash-pinned dependencies on specific scenarios
