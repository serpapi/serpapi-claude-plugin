# Search recipes

Each block is the `params` object for one call to the SerpApi `search` tool. Replace angle-bracket placeholders with real values before calling; never send a placeholder.

## Find a business, then read its reviews

```json
{"engine": "google_maps", "type": "search", "q": "The French Laundry Yountville California"}
```

The response has `place_results` for a single match or `local_results` for a list. Check both, confirm the name and address match what the user meant, and take that entry's `data_id` (`place_id` also works):

```json
{"engine": "google_maps_reviews", "data_id": "<data_id from the Maps result>", "sort_by": "newestFirst"}
```

Review text is in `reviews[].snippet`. For a map area instead of a city name, pass `ll` such as `@40.7455,-74.0083,14z`; results near the edge can fall outside the area.

## Follow an AI Overview

```json
{"engine": "google", "q": "how does photosynthesis work", "gl": "us", "hl": "en"}
```

If `ai_overview` contains the answer, use it. If it contains only a `page_token`, call the follow-up immediately, because the token expires within about a minute:

```json
{"engine": "google_ai_overview", "page_token": "<ai_overview.page_token>"}
```

Never send `q` to `google_ai_overview` or make up a token. A cached parent result can hold an expired token; repeat the parent search once with `"no_cache": true` if you need a fresh one. If Google returns no overview, say so.

## Flights

Use the user's dates in `YYYY-MM-DD`, in the future. A round trip uses `type` `1` with `return_date`:

```json
{"engine": "google_flights", "departure_id": "JFK", "arrival_id": "LHR", "outbound_date": "<YYYY-MM-DD>", "return_date": "<YYYY-MM-DD>", "type": "1", "currency": "USD", "hl": "en"}
```

A one-way trip uses `type` `2` and omits `return_date`. Combine `best_flights` and `other_flights`; each option has `price`, `total_duration`, and `flights[].airline`.

## Hotels

```json
{"engine": "google_hotels", "q": "hotels near Shibuya Tokyo", "check_in_date": "<YYYY-MM-DD>", "check_out_date": "<YYYY-MM-DD>", "adults": "2", "currency": "USD"}
```

Read `properties[].name`, `rate_per_night.extracted_lowest`, `total_rate.extracted_lowest`, and `overall_rating`.

## OpenTable reviews

Take `rid` from the restaurant URL path, without the leading slash. For `https://www.opentable.com/r/central-park-boathouse-new-york-2`:

```json
{"engine": "open_table_reviews", "rid": "r/central-park-boathouse-new-york-2"}
```

Review text is in `reviews[].content`. Don't send a restaurant name as `rid`.

## Compare prices across stores

```json
{"engine": "amazon", "k": "sony wh-1000xm5"}
```

```json
{"engine": "walmart", "query": "sony wh-1000xm5"}
```

```json
{"engine": "google_shopping_light", "q": "sony wh-1000xm5"}
```

Match the exact model before comparing, and note that each store search uses its own search credit.

## Time filters

| Engine | Parameter | Values |
|---|---|---|
| `google_light` | `as_qdr` | `d`, `w`, `m`, `y`, or with a number such as `w2` |
| `google` | `tbs` | `qdr:d`, `qdr:w`, `qdr:m`, `qdr:y` |
| `google_scholar` | `as_ylo`, `as_yhi` | Start and end year |

## Pagination

Look for `serpapi_pagination.next` or the engine's own next-page token. Copy the next page's query parameters into a new `search` call rather than fetching the returned URL. Engines differ: Google uses `start`, Amazon and Walmart use `page`, and some engines use a token. Stop when there is no next page or you have enough results, and agree on a limit with the user before fetching many pages.

## Smaller responses

When you only need to read the results, ask for Markdown. It keeps titles, snippets, and links in a readable layout. A full `google` results page is about a third the size of its JSON:

```json
{"engine": "google_light", "q": "coffee", "output": "md"}
```

When you need JSON fields but not the whole response, list the fields with `json_restrictor`:

```json
{"engine": "google_light", "q": "coffee", "json_restrictor": "error,organic_results[0:5].title,organic_results[0:5].link,organic_results[0:5].snippet"}
```

Keep `error` in the list so a failed search still reports why. Include pagination or ID fields when a later step needs them.
