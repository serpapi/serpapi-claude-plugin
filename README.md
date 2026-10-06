# SerpApi for Claude

Ask Claude to search Google, Google Maps, Amazon, YouTube, and 100+ other search engines
through [SerpApi](https://serpapi.com). Claude picks the engine that fits your question, such as Google Maps for a local
business or Google Flights for fares, and answers with links to its sources.

The plugin works in Claude Code, claude.ai, and the Claude desktop app, including Cowork.

## Before you start

You need a SerpApi API key. SerpApi's free plan includes 250 searches a
month. [Sign up](https://serpapi.com/users/sign_up), then copy your key from
the [dashboard](https://serpapi.com/dashboard).

## Set up in Claude Code

In [Claude Code](https://code.claude.com/docs/en/overview), run these two commands one at a time:

```text
/plugin marketplace add serpapi/serpapi-claude-plugin
/plugin install serpapi@serpapi-plugins
```

Claude Code asks for your API key during the install and stores it securely in your system's credential store.

To add or change the key later, run `/plugin configure serpapi@serpapi-plugins` and then `/reload-plugins`. You need
this if you installed with `claude plugin install` from a terminal, because that command doesn't ask for the key.

## Set up in claude.ai or the Claude desktop app

1. In claude.ai or the desktop app, open **Customize > Plugins**, select **Add > Add marketplace**, enter
   `serpapi/serpapi-claude-plugin`, and add the SerpApi plugin.
2. Open the plugin's **Connectors** tab and select **Connect** next to `serpapi`.
3. Under **Authentication**, choose **No sign-in**.
4. Under **Request headers**, enter `Bearer YOUR_API_KEY` as the value of the `authorization` header, with your key in
   place of `YOUR_API_KEY`. Then add the connector.

Claude stores the header value securely and doesn't show it again. Plugins and connectors belong to your Claude account,
so this one setup covers claude.ai, the desktop app, and Cowork. The plugin also appears in Claude Code, which keeps its
own copy of the key, so set the key there too as described above.

## Search

In Claude Code, use the `/serpapi:search` command:

```text
/serpapi:search coffee shops near Times Square
```

In claude.ai, the desktop app, and Cowork, type `/` and choose `serpapi:search` from the menu. In any of them you can also
ask in your own words, such as "Use SerpApi to find this week's news about solar energy." Some other requests to try:

- "Compare Sony WH-1000XM5 prices on Amazon, Walmart, and Google Shopping."
- "Show the newest reviews for The French Laundry in Yountville."
- "List research papers on transformer architectures published since 2023."
- "Find nonstop flights from New York to London next month." Claude asks for exact dates if you leave them out.

Claude answers in prose unless you ask for a table or for the raw results. Raw results come as JSON, with every field
SerpApi returns, or as Markdown, which is easier to read and shorter. A full Google results page in Markdown is about a
third the size of the JSON. Ask for Markdown when you want the results without the extra detail.

## Questions

### How many searches does a request use?

Usually one. A request that compares several stores, or reads more than one page of results, uses one search per store
or page. SerpApi counts only successful searches. Repeating an identical search within an hour is free, because SerpApi
returns the cached result. Your [dashboard](https://serpapi.com/dashboard) shows how many searches you have left, and
the [pricing page](https://serpapi.com/pricing) lists the plans.

### What does the plugin send to SerpApi?

When Claude searches, your query and any details it needs, such as a location or travel dates, go to SerpApi's MCP
server at `mcp.serpapi.com`. Your API key goes with each request in an authorization header. Claude Code sends it from
your computer. In claude.ai and the desktop app, it comes from the connector you set up. SerpApi runs the search and returns the results to
Claude.

Claude may also open SerpApi's public documentation to check an engine's options, or open a result's web page to confirm
an answer. Your key isn't sent to those pages.

The plugin contains only the server address and instructions for Claude, so nothing from it runs on your computer. It
collects no analytics, and it searches only when a request needs it. Read
SerpApi's [privacy policy](https://serpapi.com/legal#privacy-policy)
and [terms of service](https://serpapi.com/legal#terms-of-service) for how SerpApi handles your searches.

### A search failed. What now?

Claude shows you SerpApi's error message. The common ones:

| Error                                       | What to do                                                                                                                                                                                                                  |
|---------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Missing API key, or Invalid SerpApi API key | In Claude Code, run `/plugin configure serpapi@serpapi-plugins`, enter your key, then run `/reload-plugins`. In claude.ai or the desktop app, disconnect `serpapi` on the plugin's **Connectors** tab and connect it again with the right key. |
| Rate limit exceeded                         | You've used this month's searches or your plan's hourly limit. Check the [dashboard](https://serpapi.com/dashboard).                                                                                                        |
| Claude has no SerpApi tools                 | In Claude Code, run `/mcp` and check that the SerpApi server is connected. In claude.ai or the desktop app, check that the plugin's **Connectors** tab shows `serpapi` as connected.                                                           |

## Help

For questions about your SerpApi account or the search API, contact [SerpApi support](https://serpapi.com/#contact) or
email [support@serpapi.com](mailto:support@serpapi.com). Report plugin bugs
as [GitHub issues](https://github.com/serpapi/serpapi-claude-plugin/issues). Include the error message, but remove
private details and never paste your API key.

The plugin is released under the [MIT license](https://github.com/serpapi/serpapi-claude-plugin/blob/main/LICENSE).
