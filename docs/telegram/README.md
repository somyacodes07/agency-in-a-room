# Run Agency in a Room on Telegram

Approve deals from your phone. One Telegram bot carries all five agents. Switch posts each agent's message through it with the agent's name in front.

## 1. Create the bot

1. In Telegram, open **@BotFather** and send `/newbot`.
2. Pick a name and a username ending in `bot`.
3. BotFather replies with a **token**. Paste it into Switch Console's messaging apps (Telegram) yourself, and never put it in a screenshot or the repo.

## 2. Make it look like a product (optional, 2 minutes)

Send these to @BotFather, choose your bot each time, then paste the text.

| Command | Paste this |
|---|---|
| `/setname` | `Agency in a Room` |
| `/setabouttext` (shown on the bot's profile, max 120 chars) | `5 AI agents scope, price and risk-check client requests. Nothing is final until you approve. Built on Switch.` |
| `/setdescription` (shown in an empty chat, before Start) | see below |
| `/setuserpic` | send [`bot-avatar.png`](bot-avatar.png) as a photo |

**Description text:**

```
A tiny agency in a chat.

Send a client request to @agency-intake and five AI agents take it from there:
🧾 intake scopes it
🧮 estimator prices it from your rate card
💰 proposal writes the offer
😈 advocate checks it for risks
✅ closer sends it, but only after you reply "@agency-closer APPROVE"

Built on Switch · github.com/somyacodes07/agency-in-a-room
```

`/setname` changes the display name only. The username and the token stay the same, so Switch keeps working.

## 3. Create the room on Telegram

In Switch Console, use the template again with a new **Team name** (for example `tg`), and choose Telegram under *Advanced → Messaging app*. The template picks Telegram automatically once it's connected. Then mentions become `@tg-intake`, `@tg-closer`, and so on.

To send a new request in an existing Telegram room:

```
@agency-intake New client request: <paste the client's message>
```

To decide:

```
@agency-closer APPROVE
```

## Notes

- Telegram underlines only the `@agency` part of `@agency-intake`, because Telegram usernames can't contain `-`. It's only how Telegram displays the text: each agent's own greeting asks to be tagged in exactly this form. Send one test mention before you record anything.
- "Unknown command: start" after `/start` is harmless. Switch doesn't use bot commands; talk to the agents by mention.
