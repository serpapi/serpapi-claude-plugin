# SerpApi engine reference

Use this reference to choose an engine, then read that engine's linked documentation page for its parameters and response fields. The live page is the authority. Prefer a `_light` engine when its features fit the request.

This list was checked against SerpApi's documentation index and the hosted MCP server on 2026-10-06, and may miss newer engines. Find those in [SerpApi's documentation index](https://serpapi.com/llms.txt) or the MCP resource `serpapi://engines`. `None listed` means the engine has no input that is always required; some operations still need one. Don't guess IDs, tokens, or required fields.

## Amazon (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`amazon`](https://serpapi.com/amazon-search-api.md) | Amazon product search | None listed |
| [`amazon_autocomplete`](https://serpapi.com/amazon-autocomplete-api.md) | Amazon autocomplete suggestions | k |
| [`amazon_product`](https://serpapi.com/amazon-product-api.md) | Amazon product details | asin |

## Apple (5 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`apple_app_store`](https://serpapi.com/apple-app-store.md) | Apple App Store results | term |
| [`apple_maps`](https://serpapi.com/apple-maps-api.md) | Apple Maps local search | query |
| [`apple_maps_places`](https://serpapi.com/apple-maps-places-api.md) | Apple Maps Places details | muid |
| [`apple_product`](https://serpapi.com/apple-product.md) | Apple App Store product details | product_id |
| [`apple_reviews`](https://serpapi.com/apple-reviews.md) | Apple App Store reviews | product_id |

## Baidu (2 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`baidu`](https://serpapi.com/baidu-search-api.md) | Baidu Search results | q |
| [`baidu_news`](https://serpapi.com/baidu-news-api.md) | Baidu News search | q |

## Bing (9 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`bing`](https://serpapi.com/bing-search-api.md) | Main Bing Search results | q |
| [`bing_copilot`](https://serpapi.com/bing-copilot-api.md) | Bing Copilot results | q |
| [`bing_images`](https://serpapi.com/bing-images-api.md) | Bing Images search | q |
| [`bing_maps`](https://serpapi.com/bing-maps-api.md) | Bing Maps search | q |
| [`bing_news`](https://serpapi.com/bing-news-api.md) | Bing News search | q |
| [`bing_product`](https://serpapi.com/bing-product-api.md) | Bing Product results | product_token |
| [`bing_reverse_image`](https://serpapi.com/bing-reverse-image-api.md) | Bing reverse image search | image_url |
| [`bing_shopping`](https://serpapi.com/bing-shopping-api.md) | Bing Shopping search | q |
| [`bing_videos`](https://serpapi.com/bing-videos-api.md) | Bing Videos search | q |

## Brave (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`brave_ai_mode`](https://serpapi.com/brave-ai-mode-api.md) | Brave AI Mode search | q |

## Duckduckgo (4 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`duckduckgo`](https://serpapi.com/duckduckgo-search-api.md) | Main DuckDuckGo Search results | q |
| [`duckduckgo_light`](https://serpapi.com/duckduckgo-light-api.md) | Fast DuckDuckGo Search results | q |
| [`duckduckgo_maps`](https://serpapi.com/duckduckgo-maps-api.md) | DuckDuckGo Maps results | q |
| [`duckduckgo_news`](https://serpapi.com/duckduckgo-news-api.md) | DuckDuckGo News results | q |

## Ebay (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`ebay`](https://serpapi.com/ebay-search-api.md) | eBay product search | _nkw |
| [`ebay_product`](https://serpapi.com/ebay-product-api.md) | eBay product details | product_id |
| [`ebay_seller`](https://serpapi.com/ebay-seller-api.md) | eBay seller profile and product listings | seller_id, type |

## Facebook (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`facebook_profile`](https://serpapi.com/facebook-profile-api.md) | Facebook public profile data | profile_id |

## Google (64 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`google`](https://serpapi.com/search-api.md) | Main Google Search results | q |
| [`google_about_this_result`](https://serpapi.com/google-about-this-result) | Google "About This Result" feature data | q |
| [`google_ads`](https://serpapi.com/google-ads-api.md) | Google Ads keyword-level sponsored results (higher rate than Google Search) | location, q |
| [`google_ads_transparency_center`](https://serpapi.com/google-ads-transparency-center-api.md) | Google Ads Transparency Center lookup by advertiser | None listed |
| [`google_ads_transparency_center_ad_details`](https://serpapi.com/google-ads-transparency-center-ad-details) | Individual ad creative details | advertiser_id, creative_id |
| [`google_ai_mode`](https://serpapi.com/google-ai-mode-api.md) | Google AI-powered search mode | q |
| [`google_ai_overview`](https://serpapi.com/google-ai-overview-api.md) | Google AI Overview results | page_token |
| [`google_autocomplete`](https://serpapi.com/google-autocomplete-api.md) | Google search autocomplete suggestions | q |
| [`google_events`](https://serpapi.com/google-events-api.md) | Google Events search | q |
| [`google_finance`](https://serpapi.com/google-finance-api.md) | Google Finance stock/market data | q |
| [`google_finance_markets`](https://serpapi.com/google-finance-markets.md) | Google Finance market overview | trend |
| [`google_flights`](https://serpapi.com/google-flights-api.md) | Google Flights search | None listed |
| [`google_flights_autocomplete`](https://serpapi.com/google-flights-autocomplete-api.md) | Google Flights autocomplete | q |
| [`google_flights_deals`](https://serpapi.com/google-flights-deals-api.md) | Google Flights deal discovery (no fixed route) | None listed |
| [`google_forums`](https://serpapi.com/google-forums-api.md) | Google Forums results | q |
| [`google_hotels`](https://serpapi.com/google-hotels-api.md) | Google Hotels search | check_in_date, check_out_date, q |
| [`google_hotels_autocomplete`](https://serpapi.com/google-hotels-autocomplete-api.md) | Google Hotels autocomplete suggestions | q |
| [`google_hotels_photos`](https://serpapi.com/google-hotels-photos-api.md) | Google Hotels photos | property_token |
| [`google_hotels_reviews`](https://serpapi.com/google-hotels-reviews-api.md) | Google Hotels reviews | property_token |
| [`google_images`](https://serpapi.com/google-images-api.md) | Google Images search | q |
| [`google_images_light`](https://serpapi.com/google-images-light-api.md) | Fast Google Images results | q |
| [`google_images_related_content`](https://serpapi.com/google-images-related-content-api.md) | Related content for Google Images | related_content_id |
| [`google_immersive_product`](https://serpapi.com/google-immersive-product-api.md) | Google Immersive Product results | page_token |
| [`google_jobs`](https://serpapi.com/google-jobs-api.md) | Google for Jobs search | q |
| [`google_jobs_listing`](https://serpapi.com/google-jobs-listing-api) | Detailed Google Jobs listing | q |
| [`google_lens`](https://serpapi.com/google-lens-api.md) | Google Lens visual search | type, url |
| [`google_light`](https://serpapi.com/google-light-api.md) | Fast, essential Google Search results | q |
| [`google_local`](https://serpapi.com/google-local-api.md) | Google Local results | q |
| [`google_local_services`](https://serpapi.com/google-local-services-api.md) | Google Local Services results | data_cid, q |
| [`google_maps`](https://serpapi.com/google-maps-api.md) | Google Maps search | type |
| [`google_maps_autocomplete`](https://serpapi.com/google-maps-autocomplete-api.md) | Google Maps autocomplete suggestions | ll, q |
| [`google_maps_contributor_reviews`](https://serpapi.com/google-maps-contributor-reviews-api.md) | Google Maps contributor reviews | contributor_id |
| [`google_maps_directions`](https://serpapi.com/google-maps-directions-api.md) | Directions from Google Maps | None listed |
| [`google_maps_photo_meta`](https://serpapi.com/google-maps-photo-meta-api) | Metadata for Google Maps photos | data_id |
| [`google_maps_photos`](https://serpapi.com/google-maps-photos-api.md) | Photos for a Google Maps place | data_id |
| [`google_maps_posts`](https://serpapi.com/google-maps-posts-api.md) | Posts for a Google Maps place | data_id |
| [`google_maps_reviews`](https://serpapi.com/google-maps-reviews-api.md) | Reviews for a Google Maps place | None listed |
| [`google_news`](https://serpapi.com/google-news-api.md) | Google News results | None listed |
| [`google_news_light`](https://serpapi.com/google-news-light-api.md) | Fast Google News results | q |
| [`google_patents`](https://serpapi.com/google-patents-api.md) | Google Patents results | None listed |
| [`google_patents_details`](https://serpapi.com/google-patents-details-api.md) | Individual patent details | patent_id |
| [`google_play`](https://serpapi.com/google-play-api.md) | Google Play Store results | None listed |
| [`google_play_books`](https://serpapi.com/google-play-books.md) | Google Play Books search | None listed |
| [`google_play_games`](https://serpapi.com/google-play-games.md) | Google Play Games search | None listed |
| [`google_play_movies`](https://serpapi.com/google-play-movies.md) | Google Play Movies search | None listed |
| [`google_play_product`](https://serpapi.com/google-play-product-api.md) | Google Play product details | product_id, store |
| [`google_related_questions`](https://serpapi.com/google-related-questions-api.md) | Google "People Also Ask" questions | next_page_token |
| [`google_reverse_image`](https://serpapi.com/google-reverse-image.md) | Google reverse image search | image_url |
| [`google_scholar`](https://serpapi.com/google-scholar-api.md) | Google Scholar results | q |
| [`google_scholar_author`](https://serpapi.com/google-scholar-author-api.md) | Google Scholar author profile | author_id |
| [`google_scholar_case_law`](https://serpapi.com/google-scholar-case-law-api.md) | Google Scholar case law details | case_id |
| [`google_scholar_cite`](https://serpapi.com/google-scholar-cite-api) | Google Scholar citation details | q |
| [`google_shopping`](https://serpapi.com/google-shopping-api.md) | Google Shopping product search | q |
| [`google_shopping_filters`](https://serpapi.com/google-shopping-filters-api) | Google Shopping filters and facets | q |
| [`google_shopping_light`](https://serpapi.com/google-shopping-light-api.md) | Fast Google Shopping results | q |
| [`google_short_videos`](https://serpapi.com/google-short-videos-api.md) | Google Short Videos (Shorts/TikTok style) | q |
| [`google_sports`](https://serpapi.com/google-sports-api.md) | Google Sports games, leagues, and teams | kgmid, sp, type |
| [`google_travel_explore`](https://serpapi.com/google-travel-explore-api.md) | Google Travel Explore destinations | departure_id |
| [`google_trends`](https://serpapi.com/google-trends-api.md) | Google Trends results | q |
| [`google_trends_autocomplete`](https://serpapi.com/google-trends-autocomplete.md) | Google Trends autocomplete | q |
| [`google_trends_news`](https://serpapi.com/google-trends-news) | Google Trends news articles | page_token |
| [`google_trends_trending_now`](https://serpapi.com/google-trends-trending-now.md) | Google Trends trending searches | geo |
| [`google_videos`](https://serpapi.com/google-videos-api.md) | Google Videos search | q |
| [`google_videos_light`](https://serpapi.com/google-videos-light-api.md) | Fast Google Videos results | q |

## Home (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`home_depot`](https://serpapi.com/home-depot-search-api.md) | Home Depot product search | q |
| [`home_depot_product`](https://serpapi.com/home-depot-product.md) | Home Depot product details | product_id |
| [`home_depot_product_reviews`](https://serpapi.com/home-depot-product-reviews.md) | Home Depot product reviews | product_id |

## Instagram (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`instagram_profile`](https://serpapi.com/instagram-profile-api.md) | Instagram public profile data | profile_id |

## Naver (2 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`naver`](https://serpapi.com/naver-search-api.md) | Naver Search results | query |
| [`naver_ai_overview`](https://serpapi.com/naver-ai-overview-api.md) | Naver AI Overview results | None listed |

## OpenTable (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`open_table_reviews`](https://serpapi.com/open-table-reviews-api.md) | OpenTable reviews | rid |

## SerpApi's index (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`search_index`](https://serpapi.com/search-index-api.md) | SerpApi's own LLM-first web index (preview) | q |

## Tripadvisor (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`tripadvisor`](https://serpapi.com/tripadvisor-search-api.md) | Tripadvisor results | q |
| [`tripadvisor_place`](https://serpapi.com/tripadvisor-place-api.md) | Tripadvisor place details | place_id |
| [`tripadvisor_reviews`](https://serpapi.com/tripadvisor-reviews-api.md) | Tripadvisor place reviews | place_id |

## Walmart (4 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`walmart`](https://serpapi.com/walmart-search-api.md) | Walmart product search | query |
| [`walmart_product`](https://serpapi.com/walmart-product-api.md) | Walmart product details | product_id |
| [`walmart_product_reviews`](https://serpapi.com/walmart-product-reviews-api.md) | Walmart product reviews | product_id |
| [`walmart_product_sellers`](https://serpapi.com/walmart-product-sellers-api) | Walmart product sellers | product_id, store_id |

## Yahoo (3 engines)

`yahoo_shopping` is discontinued and returns an error, even though `serpapi://engines` still lists it. Use `google_shopping_light` instead.

| Engine | Description | Required inputs |
|---|---|---|
| [`yahoo`](https://serpapi.com/yahoo-search-api.md) | Yahoo! Search results | p |
| [`yahoo_images`](https://serpapi.com/yahoo-images-api.md) | Yahoo! Images results | p |
| [`yahoo_videos`](https://serpapi.com/yahoo-videos-api.md) | Yahoo! Videos results | p |

## Yandex (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`yandex`](https://serpapi.com/yandex-search-api.md) | Yandex Search results | text |
| [`yandex_images`](https://serpapi.com/yandex-images-api.md) | Yandex Images results | text |
| [`yandex_videos`](https://serpapi.com/yandex-videos-api.md) | Yandex Videos search | text |

## Yelp (3 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`yelp`](https://serpapi.com/yelp-search-api.md) | Yelp business search | find_loc |
| [`yelp_place`](https://serpapi.com/yelp-place.md) | Yelp business details | place_id |
| [`yelp_reviews`](https://serpapi.com/yelp-reviews-api.md) | Yelp reviews | place_id |

## Youtube (4 engines)

| Engine | Description | Required inputs |
|---|---|---|
| [`youtube`](https://serpapi.com/youtube-search-api.md) | YouTube Search results | search_query |
| [`youtube_channel`](https://serpapi.com/youtube-channel-api.md) | YouTube channel content | None listed |
| [`youtube_video`](https://serpapi.com/youtube-video-api.md) | YouTube video details | None listed |
| [`youtube_video_transcript`](https://serpapi.com/youtube-video-transcript.md) | YouTube video transcript | v |

## Zillow (1 engine)

| Engine | Description | Required inputs |
|---|---|---|
| [`zillow`](https://serpapi.com/zillow-search-api.md) | Zillow property search | None listed |

## Result Key by Engine

| Engine Category | Result Key |
|:---|:---|
| Web (`google_light`, `google`, `bing`, `duckduckgo`) | `organic_results` |
| News (`google_news_light`, `duckduckgo_news`) | `news_results` |
| Bing News (`bing_news`) | `organic_results` |
| Images (`google_images_light`, `google_images`) | `images_results` |
| Shopping (`google_shopping_light`, `google_shopping`) | `shopping_results` |
| Product search (`amazon`, `walmart`, `ebay`) | `organic_results` |
| Amazon autocomplete (`amazon_autocomplete`) | `suggestions` |
| eBay seller (`ebay_seller`) | `seller_results`, `product_results` |
| Jobs (`google_jobs`) | `jobs_results` |
| Maps (`google_maps`), list results | `local_results` |
| Maps (`google_maps`), single place | `place_results` |
| Maps Reviews (`google_maps_reviews`) | `reviews` |
| Videos (`google_videos_light`) | `video_results` |
| YouTube (`youtube`) | `video_results` |
| YouTube channel (`youtube_channel`, default tab) | `channel_results`, `videos_results` |
| Zillow (`zillow`) | `organic_results` |
| Scholar (`google_scholar`) | `organic_results` |
| Flights (`google_flights`) | `best_flights`, `other_flights` |
| Finance (`google_finance`) | `summary`, `graph`, `news_results` |
| Hotels (`google_hotels`) | `properties` |
| Trends (`google_trends`) | `interest_over_time`, `interest_by_region`, `related_queries`, or `related_topics`, selected by `data_type` |
| Sports (`google_sports`) | `game_results`, `league_results`, `team_results` (by `type`) |
| Walmart reviews (`walmart_product_reviews`) | `reviews` |
| App Store (`apple_app_store`) | `organic_results` |
| Search Index (`search_index`) | `organic_results` |
