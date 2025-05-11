#!/usr/bin/python3

import requests

cards = [
    {"Front": "1. I do deep, meaningful work. I do not fuck around.",
        "Back": "This life is too short for mediocrity or bullshit."},
    {"Front": "2. I am a problem-solving machine. I never settle.",
        "Back": "If it breaks, I fix it. If I fail, I learn. If I win, I raise the bar."},
    {"Front": "3. Comfort is the enemy. I live with deliberate intensity.",
        "Back": "Pain is data. Struggle is the test. I choose the hard path—on purpose."},
    {"Front": "4. I am a polymathic beast. I win across domains.",
        "Back": "I don’t fit in one box. I study everything, connect dots, and build systems."},
    {"Front": "5. I am not here to study. I am here to <em>transform</em>.",
        "Back": "This is about mastery, not marks. Becoming, not conforming."},
    {"Front": "6. I am ruthlessly focused. Calm, sharp, unshakeable.",
        "Back": "Equanimity under chaos. Laser-beam mind. Relentless improvement."},
    {"Front": "7. I am done being mid. I am inevitable.",
        "Back": "No more playing small. I am building a future that rewrites the rules."},

    # Add more card dicts here
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
                    "Context": "The 7 Commandments"
                },
                "tags": ["self-improvement", "war-general-arc"],
                "options": {
                    "allowDuplicate": False
                }
            } for card in cards
        ]
    }
}

res = requests.post("http://localhost:8765", json=payload)
print(res.json())
