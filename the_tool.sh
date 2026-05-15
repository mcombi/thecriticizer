#!/usr/bin/env bash

set -euo pipefail

OPENERS=(
  "Oh wow,"
  "Let me be honest:"
  "Nobody asked, but"
  "Unsolicited opinion:"
  "With all due disrespect,"
  "I hate to say it, but"
  "Brace yourself:"
  "Scientifically speaking,"
  "According to my very biased analysis,"
  "Hot take:"
  "Fun fact that isn't fun:"
  "After careful consideration,"
)

VERDICTS=(
  "is an absolute disaster"
  "is fundamentally broken"
  "should be illegal"
  "makes no sense whatsoever"
  "is the worst idea since sliced bread"
  "is deeply suspicious"
  "belongs in a museum of failures"
  "is aggressively mediocre"
  "defies all logic"
  "is a cry for help"
  "has no redeeming qualities"
  "was clearly designed by someone in a hurry"
  "is an affront to good taste"
  "makes experts weep"
  "is embarrassingly overrated"
  "is statistically improbable to be this bad"
  "is a bold choice, and not in a good way"
  "should come with a warning label"
  "is doing the bare minimum and failing"
  "gives off bad vibes on a molecular level"
)

REASONS=(
  "The color palette alone is a war crime."
  "It smells like a bad decision."
  "Even the concept is tired."
  "Nobody thought this through."
  "The execution is somehow worse than the idea."
  "It peaked years ago and has been in decline since."
  "The target audience deserves better."
  "It's the beige of its category."
  "Physics disagrees."
  "The documentation is a lie."
  "It has the energy of a Monday morning."
  "Every aspect of it is a compromise."
  "The name alone should have been a red flag."
  "It was probably designed by a committee."
  "Someone got paid for this. That's the real crime."
  "The confidence with which it exists is staggering."
  "It thinks it's better than it is."
  "It has the structural integrity of wet paper."
  "I've seen better ideas scrawled on a napkin."
  "The math doesn't add up."
)

CLOSERS=(
  "And yet, here we are."
  "You're welcome for the honesty."
  "Don't shoot the messenger."
  "I said what I said."
  "Feel free to disagree. You'd be wrong."
  "This is not up for debate."
  "Take it or leave it — I recommend taking it."
  "A second opinion will not help you."
  "Adjust your expectations accordingly."
  "I will not be taking questions."
)

random_element() {
  local arr=("$@")
  echo "${arr[RANDOM % ${#arr[@]}]}"
}

criticize() {
  local subject="$1"
  local opener verdict reason closer
  opener=$(random_element "${OPENERS[@]}")
  verdict=$(random_element "${VERDICTS[@]}")
  reason=$(random_element "${REASONS[@]}")
  closer=$(random_element "${CLOSERS[@]}")

  echo ""
  echo "  $opener \"$subject\" $verdict."
  echo "  $reason $closer"
  echo ""
}

if [[ $# -gt 0 ]]; then
  for subject in "$@"; do
    criticize "$subject"
  done
elif [[ ! -t 0 ]]; then
  while IFS= read -r line; do
    [[ -n "$line" ]] && criticize "$line"
  done
else
  RANDOM_SUBJECTS=(
    "your morning routine"
    "that font you picked"
    "the cloud"
    "agile methodology"
    "your git history"
    "this script"
    "your last pull request"
    "the semicolon debate"
    "tabs vs spaces"
    "your README"
    "that variable name"
    "your coffee order"
    "microservices"
    "the metaverse"
    "your playlist"
    "that meeting that could have been an email"
    "blockchain"
    "your sleep schedule"
    "monorepos"
    "your IDE theme"
  )
  subject=$(random_element "${RANDOM_SUBJECTS[@]}")
  criticize "$subject"
fi
