# Claude Code + Warp

Official [Warp](https://warp.dev) terminal integration for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Features

### 🔔 Native Notifications

Get native Warp notifications when Claude Code:
- **Completes a task** — with a summary showing your prompt and Claude's response
- **Needs your input** — when Claude requires approval or has a question

Notifications appear in Warp's notification center and as system notifications, so you can context-switch while Claude works and get alerted when attention is needed.

**Example notification:**
```
"what's 1+1" → 2
```

## Installation

```bash
# In Claude Code, add the marketplace
/plugin marketplace add warpdotdev/claude-code-warp

# Install the Warp plugin
/plugin install warp@claude-code-warp
```

> ⚠️ **Important**: After installing, **restart Claude Code** for notifications to activate.

Once restarted, you'll see a confirmation message and notifications will appear automatically when Claude completes tasks.

## Requirements

- [Warp terminal](https://warp.dev) (macOS, Linux, or Windows)
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- `jq` for JSON parsing (install via `brew install jq` or your package manager)

## How It Works

This plugin uses Warp's [pluggable notifications](https://docs.warp.dev/features/notifications) feature via OSC escape sequences. When Claude Code triggers a hook event, the plugin:

1. Reads the session transcript to extract your original prompt and Claude's response
2. Formats a concise notification message
3. Sends an OSC 777 escape sequence to Warp, which displays a native notification

The plugin registers three hooks:
- **SessionStart** — shows a welcome message confirming the plugin is active
- **Stop** — fires when Claude finishes responding
- **Notification** — fires when Claude needs user input

## Configuration

Notifications work out of the box. To customize Warp's notification behavior (sounds, system notifications, etc.), see [Warp's notification settings](https://docs.warp.dev/features/notifications).

## Roadmap

Future Warp integrations planned:
- Warp AI context sharing
- Warp Drive integration for sharing Claude Code configurations
- Custom slash commands

## Uninstall

```bash
/plugin uninstall warp@claude-code-warp
/plugin marketplace remove claude-code-warp
```

## Contributing

Contributions welcome! Please open an issue or PR on [GitHub](https://github.com/warpdotdev/claude-code-warp).

## License

MIT License — see [LICENSE](LICENSE) for details.
