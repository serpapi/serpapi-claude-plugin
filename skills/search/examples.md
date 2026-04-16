# SerpApi Curl Examples

## Basic Google Search (Light)

```bash
curl -s "https://serpapi.com/search.json?engine=google_light&q=best+python+web+frameworks&api_key=$SERPAPI_API_KEY"
```

## Location-Specific Google Search

```bash
curl -s "https://serpapi.com/search.json?engine=google_light&q=coffee+shops&location=Austin,+Texas,+United+States&hl=en&gl=us&api_key=$SERPAPI_API_KEY"
```

## Full Google Search (with Knowledge Graph, Ads, etc.)

```bash
curl -s "https://serpapi.com/search.json?engine=google&q=Tesla&location=New+York,+United+States&hl=en&gl=us&api_key=$SERPAPI_API_KEY"
```

## Google Scholar — Academic Papers

```bash
curl -s "https://serpapi.com/search.json?engine=google_scholar&q=transformer+architecture+attention&as_ylo=2020&api_key=$SERPAPI_API_KEY"
```

## Amazon Product Search

```bash
curl -s "https://serpapi.com/search.json?engine=amazon&k=mechanical+keyboard&api_key=$SERPAPI_API_KEY"
```

## Walmart Product Search

```bash
curl -s "https://serpapi.com/search.json?engine=walmart&query=airpods+pro&sort=price_low&api_key=$SERPAPI_API_KEY"
```

## eBay Product Search

```bash
curl -s "https://serpapi.com/search.json?engine=ebay&_nkw=vintage+vinyl+records&api_key=$SERPAPI_API_KEY"
```

## Google Maps — Local Businesses

```bash
curl -s "https://serpapi.com/search.json?engine=google_maps&q=pizza&ll=%4040.7455096%2C-74.0083012%2C14z&type=search&api_key=$SERPAPI_API_KEY"
```

## Google Maps with Location Name

```bash
curl -s "https://serpapi.com/search.json?engine=google_maps&q=restaurants&location=San+Francisco,+California&type=search&z=13&api_key=$SERPAPI_API_KEY"
```

## Google News — Current Events

```bash
curl -s "https://serpapi.com/search.json?engine=google_news&q=artificial+intelligence&gl=us&hl=en&api_key=$SERPAPI_API_KEY"
```

## Google Trends — Keyword Research

```bash
curl -s "https://serpapi.com/search.json?engine=google_trends&q=react,vue,svelte&api_key=$SERPAPI_API_KEY"
```

## Google Flights

```bash
curl -s "https://serpapi.com/search.json?engine=google_flights&departure_id=SFO&arrival_id=JFK&outbound_date=2026-06-01&return_date=2026-06-08&currency=USD&hl=en&api_key=$SERPAPI_API_KEY"
```

## Google Jobs

```bash
curl -s "https://serpapi.com/search.json?engine=google_jobs&q=senior+software+engineer&location=Remote&hl=en&api_key=$SERPAPI_API_KEY"
```

## Google Finance — Stock Data

```bash
curl -s "https://serpapi.com/search.json?engine=google_finance&q=AAPL:NASDAQ&api_key=$SERPAPI_API_KEY"
```

## YouTube Search

```bash
curl -s "https://serpapi.com/search.json?engine=youtube&search_query=rust+programming+tutorial&api_key=$SERPAPI_API_KEY"
```

## Pagination — Google Page 2

```bash
curl -s "https://serpapi.com/search.json?engine=google_light&q=machine+learning&start=10&api_key=$SERPAPI_API_KEY"
```

## Pagination — Amazon Page 2

```bash
curl -s "https://serpapi.com/search.json?engine=amazon&k=laptop+stand&page=2&api_key=$SERPAPI_API_KEY"
```

## Using json_restrictor for Smaller Responses

```bash
curl -s "https://serpapi.com/search.json?engine=google_light&q=openai&json_restrictor=organic_results.title,organic_results.link,organic_results.snippet&api_key=$SERPAPI_API_KEY"
```

## Price Comparison Across Engines

Run these sequentially and compare:

```bash
curl -s "https://serpapi.com/search.json?engine=amazon&k=sony+wh-1000xm5&api_key=$SERPAPI_API_KEY"
curl -s "https://serpapi.com/search.json?engine=walmart&query=sony+wh-1000xm5&api_key=$SERPAPI_API_KEY"
curl -s "https://serpapi.com/search.json?engine=google_shopping&q=sony+wh-1000xm5&api_key=$SERPAPI_API_KEY"
```

## Google AI Mode

```bash
curl -s "https://serpapi.com/search.json?engine=google_ai_mode&q=explain+quantum+computing+in+simple+terms&api_key=$SERPAPI_API_KEY"
```

## Yelp — Local Reviews

```bash
curl -s "https://serpapi.com/search.json?engine=yelp&find_desc=sushi&find_loc=Los+Angeles,+CA&api_key=$SERPAPI_API_KEY"
```

## Google Autocomplete Suggestions

```bash
curl -s "https://serpapi.com/search.json?engine=google_autocomplete&q=how+to+learn&api_key=$SERPAPI_API_KEY"
```

## Check Account Usage

```bash
curl -s "https://serpapi.com/account.json?api_key=$SERPAPI_API_KEY"
```
