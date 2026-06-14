# Heddle Homebrew Tap

This tap publishes the macOS Heddle cask.

After the first stable cask release is merged:

```bash
brew install --cask heddleco/heddle/heddle
```

The cask installs `Heddle.app` into `/Applications` and links the bundled
`heddle` CLI from the app bundle into Homebrew's `bin` directory.

## Maintainers

Stable releases from `HeddleCo/heddle` open automated pull requests here that
update `Casks/heddle.rb` with the release version, DMG URL, and SHA-256
checksum. Merge those PRs after tap CI passes.
