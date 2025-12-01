# homebrew-packages

Official Homebrew tap for Spry tools.

## Available Packages

| Package | Description |
|---------|-------------|
| `spry-runbook` | Spry Runbook CLI - A runbook execution tool |
| `spry-sqlpage` | Spry SQLPage CLI - A declarative web application framework |

## Installation

First, add the tap to Homebrew:

```bash
brew tap programmablemd/homebrew-packages
```

Then, install the desired package(s):

```bash
# Add the tap
brew tap programmablemd/homebrew-packages

# Install spry-sqlpage
brew install spry-sqlpage

# Install spry-runbook
brew install spry-runbook

# Or install directly without tapping
brew install programmablemd/packages/spry-sqlpage
brew install programmablemd/packages/spry-runbook
```

## Usage

After installation, you can run:

```bash
# Spry Runbook
spry-runbook --version

# Spry SQLPage
spry-sqlpage --version
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade spry-runbook spry-sqlpage
```

## Uninstalling

To remove the tools:

```bash
brew uninstall spry-runbook spry-sqlpage
```

To remove the tap:

```bash
brew untap programmablemd/homebrew-packages
```
