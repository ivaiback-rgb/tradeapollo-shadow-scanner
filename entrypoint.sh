#!/bin/sh



echo "Initiating TradeApollo Shadow AI Scan..."



OPENAI_REGEX="sk-[a-zA-Z0-9]{48}"

ANTHROPIC_REGEX="sk-ant-[a-zA-Z0-9]+"



VIOLATIONS=$(grep -rE "$OPENAI_REGEX|$ANTHROPIC_REGEX" . 2>/dev/null)



if [ -n "$VIOLATIONS" ]; then

    echo "::error title=EU AI Act Liability Detected::Unauthorized Shadow AI API key found in local commit. Cloud-based remediation is legally insufficient. Deploy the local TradeApollo Docker audit immediately to prevent regulatory exposure. Fix here: https://www.tradeapollo.co/test

    exit 1

else

    echo "No visible Shadow AI vectors detected. Note: For full NIST RMF compliance, a localized Docker audit is still required."

    exit 0

fi
