#!/usr/bin/env bash
set -euo pipefail

PASS=0
FAIL=0
PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"

pass() { PASS=$((PASS + 1)); echo "  PASS: $1"; }
fail() { FAIL=$((FAIL + 1)); echo "  FAIL: $1"; }

echo "=== SerpApi Claude Plugin Validation ==="
echo ""

# --- Structure checks ---
echo "Checking plugin structure..."

[ -f "$PLUGIN_DIR/.claude-plugin/plugin.json" ] && pass "plugin.json exists" || fail "plugin.json missing"
[ -f "$PLUGIN_DIR/.claude-plugin/marketplace.json" ] && pass "marketplace.json exists" || fail "marketplace.json missing"
[ -f "$PLUGIN_DIR/skills/search/SKILL.md" ] && pass "SKILL.md exists" || fail "SKILL.md missing"
[ -f "$PLUGIN_DIR/skills/search/examples.md" ] && pass "examples.md exists" || fail "examples.md missing"
[ -d "$PLUGIN_DIR/engines" ] && pass "engines/ directory exists" || fail "engines/ directory missing"

ENGINE_COUNT=$(ls "$PLUGIN_DIR/engines/"*.json 2>/dev/null | wc -l | tr -d ' ')
if [ "$ENGINE_COUNT" -gt 0 ]; then
    pass "Found $ENGINE_COUNT engine schemas"
else
    fail "No engine JSON files found"
fi

echo ""

# --- JSON validity ---
echo "Checking JSON validity..."

if python3 -c "import json; json.load(open('$PLUGIN_DIR/.claude-plugin/plugin.json'))" 2>/dev/null; then
    pass "plugin.json is valid JSON"
else
    fail "plugin.json is invalid JSON"
fi

if python3 -c "import json; json.load(open('$PLUGIN_DIR/.claude-plugin/marketplace.json'))" 2>/dev/null; then
    pass "marketplace.json is valid JSON"
else
    fail "marketplace.json is invalid JSON"
fi

INVALID_ENGINES=0
for f in "$PLUGIN_DIR/engines/"*.json; do
    if ! python3 -c "import json; json.load(open('$f'))" 2>/dev/null; then
        fail "Invalid JSON: $(basename "$f")"
        INVALID_ENGINES=$((INVALID_ENGINES + 1))
    fi
done
if [ "$INVALID_ENGINES" -eq 0 ]; then
    pass "All engine JSONs are valid"
fi

echo ""

# --- SKILL.md frontmatter ---
echo "Checking SKILL.md frontmatter..."

if head -1 "$PLUGIN_DIR/skills/search/SKILL.md" | grep -q "^---$"; then
    pass "SKILL.md has YAML frontmatter"
else
    fail "SKILL.md missing YAML frontmatter"
fi

SKILL_LINES=$(wc -l < "$PLUGIN_DIR/skills/search/SKILL.md" | tr -d ' ')
if [ "$SKILL_LINES" -le 500 ]; then
    pass "SKILL.md is $SKILL_LINES lines (under 500 limit)"
else
    fail "SKILL.md is $SKILL_LINES lines (exceeds 500 limit)"
fi

echo ""

# --- API key & live test ---
echo "Checking API connectivity..."

if [ -z "${SERPAPI_API_KEY:-}" ]; then
    echo "  SKIP: SERPAPI_API_KEY not set — skipping live API test"
else
    pass "SERPAPI_API_KEY is set"

    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "https://serpapi.com/account.json?api_key=$SERPAPI_API_KEY" 2>/dev/null || echo "000")
    if [ "$RESPONSE" = "200" ]; then
        pass "API key is valid (account endpoint returned 200)"
    else
        fail "API key check failed (HTTP $RESPONSE)"
    fi
fi

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
[ "$FAIL" -eq 0 ] && exit 0 || exit 1
