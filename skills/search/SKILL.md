---
name: search
description: Search Google, Bing, Amazon, Walmart, YouTube, Google Maps, Google Scholar, and 100+ other engines via the SerpApi REST API. Calls the API using curl. Use when the user wants to search the web, find products or prices, look up local businesses, research academic papers, check news, find jobs, compare flights or hotels, analyze SERPs, or retrieve any search engine results.
allowed-tools: Bash(curl *) Read
---

# SerpApi Search

Search any engine via a single REST endpoint. Each API call costs one search credit.

**Important:** Always use `Bash(curl ...)` to call the SerpApi REST API. Do not use WebFetch, WebSearch, or any other HTTP tool.

## Setup

The API key must be set as an environment variable:

```bash
export SERPAPI_API_KEY="your_key_here"
```

If `SERPAPI_API_KEY` is not set, tell the user:
> Set your SerpApi API key: `export SERPAPI_API_KEY="your_key"` — get one free at https://serpapi.com/manage-api-key

## API Pattern

Every search follows the same pattern regardless of engine:

```bash
curl -s "https://serpapi.com/search.json?engine=ENGINE&QUERY_PARAM=QUERY&api_key=$SERPAPI_API_KEY"
```

The only things that vary per engine are:
1. The `engine` value
2. The query parameter name (`q`, `k`, `query`, etc.)
3. Engine-specific optional parameters

## Engine Selection

Pick the engine based on user intent:

| Intent | Engine | Query param | Docs |
|--------|--------|-------------|------|
| **Web search** | `google_light` | `q` | https://serpapi.com/google-light-api |
| Web search (full features) | `google` | `q` | https://serpapi.com/search-api |
| Bing search | `bing` | `q` | https://serpapi.com/bing-search-api |
| DuckDuckGo search | `duckduckgo` | `q` | https://serpapi.com/duckduckgo-search-api |
| Yahoo search | `yahoo` | `p` | https://serpapi.com/yahoo-search-api |
| Yandex search | `yandex` | `text` | https://serpapi.com/yandex-search-api |
| Baidu search | `baidu` | `q` | https://serpapi.com/baidu-search-api |
| **AI search** | `google_ai_mode` | `q` | https://serpapi.com/google-ai-mode-api |
| AI overview | `google_ai_overview` | `q` | https://serpapi.com/google-ai-overview-api |
| Bing Copilot | `bing_copilot` | `q` | https://serpapi.com/bing-copilot-api |
| Brave AI | `brave_ai_mode` | `q` | https://serpapi.com/brave-ai-mode-api |
| **Amazon products** | `amazon` | `k` | https://serpapi.com/amazon-search-api |
| Walmart products | `walmart` | `query` | https://serpapi.com/walmart-search-api |
| eBay products | `ebay` | `_nkw` | https://serpapi.com/ebay-search-api |
| Google Shopping | `google_shopping` | `q` | https://serpapi.com/google-shopping-api |
| Home Depot | `home_depot` | `q` | https://serpapi.com/home-depot-search-api |
| **Google Maps / local** | `google_maps` | `q` | https://serpapi.com/google-maps-api |
| Google Local | `google_local` | `q` | https://serpapi.com/google-local-api |
| Yelp | `yelp` | `find_desc` | https://serpapi.com/yelp-search-api |
| TripAdvisor | `tripadvisor` | `q` | https://serpapi.com/tripadvisor-search-api |
| OpenTable reviews | `open_table_reviews` | `restaurant_id` | https://serpapi.com/open-table-reviews-api |
| **Google Scholar** | `google_scholar` | `q` | https://serpapi.com/google-scholar-api |
| Google Patents | `google_patents` | `q` | https://serpapi.com/google-patents-api |
| **Google News** | `google_news` | `q` | https://serpapi.com/google-news-api |
| Google Trends | `google_trends` | `q` | https://serpapi.com/google-trends-api |
| **Google Images** | `google_images` | `q` | https://serpapi.com/google-images-api |
| Google Videos | `google_videos` | `q` | https://serpapi.com/google-videos-api |
| Google Lens | `google_lens` | `url` | https://serpapi.com/google-lens-api |
| YouTube | `youtube` | `search_query` | https://serpapi.com/youtube-search-api |
| **Google Flights** | `google_flights` | (see params) | https://serpapi.com/google-flights-api |
| Google Hotels | `google_hotels` | `q` | https://serpapi.com/google-hotels-api |
| Google Travel | `google_travel_explore` | (see params) | https://serpapi.com/google-travel-explore-api |
| **Google Jobs** | `google_jobs` | `q` | https://serpapi.com/google-jobs-api |
| **Google Finance** | `google_finance` | `q` | https://serpapi.com/google-finance-api |
| Google Play | `google_play` | `q` | https://serpapi.com/google-play-api |
| Apple App Store | `apple_app_store` | `term` | https://serpapi.com/apple-app-store |
| **Google Autocomplete** | `google_autocomplete` | `q` | https://serpapi.com/google-autocomplete-api |
| Naver | `naver` | `query` | https://serpapi.com/naver-search-api |

**Default to `google_light` for general web searches** — it's faster and cheaper than `google`. Use `google` only when you need knowledge graph, ads, or advanced SERP features.

## Engine Parameters

Each engine has its own parameters documented in a JSON schema file at `engines/<engine_name>.json` relative to this plugin's root directory. Read the relevant file when you need engine-specific parameter details.

The JSON schema structure:
- `params`: engine-specific parameters (query, filters, pagination, etc.)
- `common_params`: shared SerpApi parameters (api_key, device, no_cache, etc.)
- Each param has `description`, optional `required`, `type`, `options`, and `group` fields.

## Common Parameters

These work across most engines:

| Param | Description |
|-------|-------------|
| `location` | Search origin (city-level recommended). E.g., `Austin, Texas, United States` |
| `gl` | Country code. E.g., `us`, `uk`, `fr` |
| `hl` | Language code. E.g., `en`, `es`, `de` |
| `device` | `desktop` (default), `tablet`, or `mobile` |
| `no_cache` | `true` to force fresh results (costs a credit; cached results are free) |
| `num` | Number of results (where supported) |
| `start` / `page` | Pagination. Google uses `start` (0, 10, 20...), Amazon/Walmart use `page` (1, 2, 3...) |
| `json_restrictor` | Restrict response fields for smaller payloads. E.g., `organic_results.title,organic_results.link` |

## Response Handling

SerpApi returns structured JSON. Key top-level fields vary by engine:

- **Web search**: `organic_results`, `knowledge_graph`, `answer_box`, `related_questions`, `local_results`
- **Shopping**: `shopping_results` or `organic_results` (with price, rating, etc.)
- **Maps**: `local_results` (with address, rating, GPS coordinates, phone)
- **Scholar**: `organic_results` (with citation_id, cited_by count, PDF links)
- **News**: `news_results`
- **Images**: `images_results`
- **Flights**: `best_flights`, `other_flights`, `price_insights`
- **Jobs**: `jobs_results`
- **Finance**: `summary`, `financials`, `graph`

Always summarize results for the user. Never dump raw JSON unless explicitly asked.

Use `json_restrictor` to reduce response size when you only need specific fields.

## Multi-Engine Comparison

For price comparisons or cross-engine research, query multiple engines sequentially:

```bash
# Compare prices across Amazon, Walmart, and Google Shopping
curl -s "https://serpapi.com/search.json?engine=amazon&k=airpods+pro&api_key=$SERPAPI_API_KEY"
curl -s "https://serpapi.com/search.json?engine=walmart&query=airpods+pro&api_key=$SERPAPI_API_KEY"
curl -s "https://serpapi.com/search.json?engine=google_shopping&q=airpods+pro&api_key=$SERPAPI_API_KEY"
```

Consolidate and compare the results for the user.

## Rules

1. **Always use `curl` via Bash.** Never use WebFetch, WebSearch, or other HTTP tools. The `allowed-tools` header restricts this skill to `Bash(curl *)` and `Read`.
2. **Confirm before searching** when the query or engine choice is ambiguous. Each non-cached call costs one credit.
3. **Show the curl command** before executing so the user sees exactly what's being called.
4. **Prefer `google_light`** over `google` for simple web searches.
5. **Use `no_cache=false`** (the default) to benefit from free cached results.
6. **URL-encode query parameters** properly. Spaces become `+` or `%20`.
7. **Read the engine schema** from `engines/<engine>.json` when you need to look up available parameters for a specific engine.

## Additional Resources

- For practical curl examples, see [examples.md](examples.md)
- Interactive playground: https://serpapi.com/playground
- Full API docs: https://serpapi.com/search-api
- Account & usage: https://serpapi.com/account-api
