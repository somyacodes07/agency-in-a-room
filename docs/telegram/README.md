# Run Agency in a Room on Telegram

Approve deals from your phone. One Telegram bot carries all five agents. Switch posts each agent's message through it, with the agent's name in front.

**How Telegram differs:** a bot can't create chats, and Switch ignores **direct messages** to the bot. So on Telegram you make a **group**, add the bot, and Switch turns that group into a room. Run the template once first (in Console's built-in chat) so the five agents exist, then follow the steps below.

## 1. Create the bot

1. In Telegram, open **@BotFather** and send `/newbot`. Pick a name and a username ending in `bot`.
2. BotFather replies with a **token**. Paste it into Switch Console yourself (server **Home → Messaging apps → Connect → Telegram**, with the token and the bot's username). Never put the token in a screenshot, a chat or the repo.

## 2. Turn Group Privacy off, *before* adding the bot anywhere

In @BotFather: `/mybots` → your bot → **Bot Settings** → **Group Privacy** → **Turn off**.

Otherwise the bot only sees messages that tag it. Telegram reads this setting when the bot joins a group, so turn it off first. If you already added the bot, remove it from the group and add it back.

## 3. Make the group

1. In Telegram, create a **New Group**, for example `Agency client desk`, and add your bot.
2. Switch adopts the group as a room automatically. It appears under **Your Rooms** in Switch Console.
3. Your Telegram account needs a **username** (Settings → Username). Switch identifies you by it.

## 4. Link your Telegram account (don't skip this)

The agents answer only their owner and the owner's agents, and the closer answers only the owner. Until Switch knows which Telegram account is you, they treat you as a stranger and stay silent.

1. Send any message in the group, for example `hi`.
2. In Switch Console: server **Home → Messaging apps →** your Telegram connection **→ Link my account… →** find yourself **→ This is me**.

## 5. Invite the five agents

Send these in the group, one per message:

```
/invite_agent @agency-intake
/invite_agent @agency-estimator
/invite_agent @agency-proposal
/invite_agent @agency-advocate
/invite_agent @agency-closer
```

Send `!list-agents` to check that all five are in.

## 6. Give the room its playbook and rate card

A room adopted from Telegram starts with no instructions. Open the room in Switch Console → **Configuration**, and paste the contents of [`room-instructions.txt`](room-instructions.txt) as the room instructions. That text includes the rate card, which the estimator prices from.

## 7. Run it

```
@agency-intake New client request: Full website with online ordering, payments, delivery tracking and a mobile app, live in 3 days, $200 budget, free changes after launch.
```

Wait for the advocate's verdict, then approve from your phone:

```
@agency-closer APPROVE
```

## Make the bot look like a product (optional)

Send these to @BotFather, choose your bot each time, then paste the text.

| Command | Paste this |
|---|---|
| `/setname` | `Agency in a Room` |
| `/setabouttext` (max 120 chars) | `5 AI agents scope, price and risk-check client requests. Nothing is final until you approve. Built on Switch.` |
| `/setdescription` | the block below |
| `/setuserpic` | send [`bot-avatar.png`](bot-avatar.png) as a photo |

```
A tiny agency in a group chat.

Add me to a group, then send a client request to @agency-intake. Five AI agents take it from there:
🧾 intake scopes it
🧮 estimator prices it from your rate card
💰 proposal writes the offer
😈 advocate checks it for risks
✅ closer sends it, but only after you reply "@agency-closer APPROVE"

Direct messages to me aren't routed; use a group.
Built on Switch · github.com/somyacodes07/agency-in-a-room
```

`/setname` changes only the display name. The username and the token stay the same, so Switch keeps working.

## Good to know

- **Agent names aren't Telegram users.** Telegram won't autocomplete `@agency-intake` and only underlines `@agency`, because usernames can't contain `-`. Type the full name; Switch reads it. A typo looks exactly like an agent ignoring you.
- **👀 on your message** means an agent is working on it, and a "⚙️ Working on it…" message updates as it goes.
- **Tables** don't render in Telegram, so the estimator writes one line per item.
- `/start` in a direct chat with the bot does nothing useful; that's expected.
- If you change an agent's text in `agents/`, existing agents keep their old instructions. Update them in Console (agent → instructions), or run the template with a new *Team name*.
