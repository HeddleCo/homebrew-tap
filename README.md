# Heddle Homebrew Tap

This tap publishes the macOS Heddle cask.

## Install

```bash
brew tap heddleco/tap
brew trust heddleco/tap   # recent Homebrew gates third-party taps behind a trust step
brew install --cask heddle
```

If `brew install` reports the tap is **not trusted**, the `brew trust` line above
clears it. As a one-shot alternative (skips the persistent trust), prefix the
install with the env var Homebrew suggests:

```bash
HOMEBREW_NO_REQUIRE_TAP_TRUST=1 brew install --cask heddleco/tap/heddle
```

The cask installs `Heddle.app` into `/Applications` and links the bundled
`heddle` CLI from the app bundle into Homebrew's `bin` directory.

## Maintainers

Stable releases from `HeddleCo/heddle` open automated pull requests here that
update `Casks/heddle.rb` with the release version, DMG URL, and SHA-256
checksum. Merge those PRs after tap CI passes. The tap's own CI audits each cask
with `HOMEBREW_NO_REQUIRE_TAP_TRUST=1` (it audits its own casks) — see
`.github/workflows/ci.yml`.
