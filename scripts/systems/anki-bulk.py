#!/usr/bin/python3

import requests

cards = [
    {
        "Front": "The Essentialist Polymath",
        "Back": "<ul><li>who learns things one by one and gets good at them.</li><li>who can apply the acquired knowledge to create / do / build great things.</li><li>focuses on the most essential.</li></ul>"
    },
    {
        "Front": "The Unwavered Ubermensch",
        "Back": "<ul><li>who doesn’t shy away from going beyond comfort.</li><li>who embraces pain and suffering.</li><li>who will do anything to be in control of themselves.</li></ul>"
    },
    {
        "Front": "The Efficient Ultralearner",
        "Back": "<ul><li>one who masters skills, not merely learn them.</li><li>who is capable of learning hard things efficiently.</li><li>who utilises all of the resources meticulously.</li></ul>"
    },
    {
        "Front": "The Focused Minimalist",
        "Back": "<ul><li>who maintains ruthless focus, and on the things that really matter.</li><li>who will gladly discard anything that doesn’t play a significant role in their lives and counter sunk-cost fallacy.</li><li>who chooses the essential few over trivial many.</li></ul>"
    },
    {
        "Front": "The Immaculate Introspector",
        "Back": "<ul><li>who reflects, ruminates and rebuilds himself as frequently as possible.</li><li>who tries to understand the deeper parts of himself and integrate them into their life.</li><li>who stops making recurring mistakes and fix them.</li></ul>"
    },
    {
        "Front": "The Not-so-rascal Rationalist",
        "Back": "<ul><li>who believes in the rational method and Bayesian thinking.</li><li>who religiously optimises and debugs everything (until point of highest yield)</li><li>who is humble.</li></ul>"
    },
    {
        "Front": "The Charismatic Leader",
        "Back": "<ul><li>who can guide other people to improvement and help them.</li><li>who is confident, capable and resilient</li><li>who takes on responsibility, even if it is not their fault.</li></ul>"
    }
]

payload = {
    "action": "addNotes",
    "version": 6,
    "params": {
        "notes": [
            {
                "deckName": "Default::Reflections and Life::Beliefs",
                "modelName": "Prettify Basic",
                "fields": {
                    "Front": card["Front"],
                    "Back": card["Back"],
                    "Context": "these are the people I want to be"
                },
                "tags": ["self-improvement", "war-general-arc"],
                "options": {
                    "allowDuplicate": False
                }
            } for card in cards
        ]
    }
}

# print(payload)
res = requests.post("http://localhost:8765", json=payload)
print(res.json())
