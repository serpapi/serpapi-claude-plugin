# Maintaining the plugin

The plugin has three parts. `.mcp.json` points Claude Code at SerpApi's hosted MCP server. The `userConfig` entry in `.claude-plugin/plugin.json` makes Claude Code ask each user for their API key. `skills/search/` holds the instructions Claude follows to choose engines and parameters. Everything in this folder ships to users, so keep it small.

## Check a change

```bash
claude plugin validate --strict .
claude plugin validate --strict .claude-plugin/plugin.json
```

The first command checks only `marketplace.json`. The second checks the plugin itself, including `.mcp.json`, its `${user_config.*}` references, and the skill. CI runs both on every push and pull request.

To try a change, add your local copy as a marketplace and install from it. The install asks for an API key:

```text
/plugin marketplace add /absolute/path/to/serpapi-claude-plugin
/plugin install serpapi@serpapi-plugins
```

Check that `/mcp` shows `plugin:serpapi:serpapi` as connected, then run a search. Each test search uses one search from your plan.

When you start Claude Code inside this repository, it also offers the repository's `.mcp.json` as a project MCP server named `serpapi` and asks you to approve it. Decline it. That copy can't read the plugin's API key, and the installed plugin already provides the server.

## Release

Raise `version` in `.claude-plugin/plugin.json`. The marketplace entry has no version of its own. Before submitting to Anthropic's plugin directory, run **Validate** in the [developer portal](https://claude.ai/directory/manage) and work through the [pre-submission checklist](https://claude.com/docs/plugins/pre-submission-checklist).
