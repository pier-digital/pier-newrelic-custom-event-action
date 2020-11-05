#!/bin/sh

json=$( jq -n \
                --arg et "$EVENT_TYPE" \
                --arg st "$DEPLOYMENT_STATUS" \
                --arg dc "$DESCRIPTION" \
                --arg ac "$ACTOR" \
                --arg pj "$PROJECT" \
                '{eventType: $et, status: $st, description: $dc, actor: $ac, project: $pj }' )

echo "$json" | gzip -c | curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-Insert-Key: $NEW_RELIC_INGIGHTS_INSERT_KEY" \
    -H "Content-Encoding: gzip" \
    --data-binary @- \
    "https://insights-collector.newrelic.com/v1/accounts/$NEWRELIC_ACCOUNT_ID/events"
