---
date: ""
author: Miguel Julián
theme: https://github.com/maaslalani/slides/raw/main/styles/theme.json
paging: Page %d of %d
---

# Intro

* If you are reading this...
  * you are using [Slack](https://slack.com/) a lot
  * you might want to find some useful tricks
  * you are a better person
* Pull requests are welcome
* Enjoy

---

# [Deleteme] Index

* Why reading about Slack good practices?
  * Communication will make the different between nice and excellent
  * Slack can gather most of your work related flows, optimize it!
  * What happens in Slack, stays in Slack: thus we are using Slack search


* Notifications
  * If you send a notification, you expect an early response
  * If you are receiving a notification, they are expecting an early response
  * Do not generate notifications if the answer can wait
  * Answer to notifications as early as possible


* Notification tips
  * Keep your notifications down to 0
  * Mute noise: no mercy!
    * Only receive mention notifications
    * Mute @channels and @here notifications (channel settings)
    * Mute threads when you are done with it (sometimes they diverge and you might not care about the new topic)
  * Do notgenerate noise
    * Avoid not needed mentions
    * Almost never ever use @here or @channel
  * Build a routine: do not read Slack, process Slack
    * Start with notifications so a new notification
    * There are some public/private channels you are expected to read: do it!
    

* I want to tell something to someone:
  * Normally every message is useful for more than one person, run away from DMs
    * Or think about dropping a note at channel after conversation is over
  * Would you like an early response?
    * Probably not: write your message in a channel without mention, conversation should start there in async way
    * Probably not: you probably have a regular meeting with that person, note down what you want to tell that person and add value to your sync
    * Probably not: any case not include above workarounds, re-think before notifying
  * I am adding a notification to a person, I know what I am doing
    * Option a) You need to be avaliable so synced conversation is over ASAP (consider entering a quick call)
    * Option b) Remember to respect Slack asynced basis, personal schedules and working hours
  * The first message should contain as much important information as possible
    * > Endymion: Hello hyperion
      > Hyperion: Hello endymion
      > ... 5 minutes later...
      > Endymion: Explains the issue
      > **hyperion hates now endymion a little bit more**


* Interacting with humans
  * Check that person's profile
    * Position, location, local time, pronoums
    * Current state, notifications snoozed?, connected?
    * Update your own profile
      * A custom avatar is usually useful for people reading your messages
  * Again: you are about to interact with a human
    > Hello | Good morning | Hi | ...
    > Please
    > Thank you
    > Sorry
  * Stablish how urgent should their response be from your point of view
  * In channels reactions are usually welcome so people know you are around even if you are not replying
    * But a well deserved "Thank you" has to be there instead of a reaction


* Processing Slack
  * `<Control + Click>` Opens channel, conversation, thread or threads at right column: useful to maintain live focus there mainwhile processing more channels
  * Decide which order is better for you, stablish a routine
  * What should you process?
    * Private channels you are in
    * Public channels you are expected to read
    * Threads (remember you can mute a thread)
    * Direct Messages (DMs)
    * Any other notification (integrations, slackbot, ...)
  * If you need to answer someone, you can note down or "mark as unread", so you can do it after processing
  * At some point you could hit `<shift + ESC>` (mark all as read, why not!)


* Organising your channels
  * Leave those channels you are not reading that have activity
  * If you are being invoked/mentioned there from time to time, let's call them "Other channels"
  * Create folders at your sidebar (move them up/down) at your will
  * Remember every folder can show "only unread vs. every channel" (save some precious space at your left sidebar)
    * When you are fluently using `<Control + k>` shortcut, you probably are showing only unread channels here
  * Every channel should be in a folder now (we know they are not)
    * Non interesting channels you do not want/can leave remain at "Channels" [collapse it, enjoy]
    * You probably want to create a "Midly interesting" folder
      * Place there channels that can remain unread (offtopic ones, those you read once a day, ...)
      * You can review them when you have a small timebox or at the end of your day
  * What do I star?
    * Probably nothing, but...
    * There are short-life channels that require your attention during a brief period of time
    * Finding "Multi-person DM" is tricky: star them until the topic is resolved
  * If you usually check if some person is online, create a folder for those person DMs
    * You are now seing green/red/empty status bullet (and/or slack status)


* Keyboard shortcuts
  * Be more efficient: use your mouse less
  * [Mandatory] `<Control + k>`: Opens conversation switcher
    * Start typing the channel/DM you want to open
    * Just hit `<Enter>` so Slack opens the channel/DM with notification
  * [Mandatory] `<Shift + ESC>`: Mark all as read
    * Assume you are not reading everything
  * `<Control + Shift + t(hreads)>`: Opens threads view
  * `<Control + f>`: Search
  * `<+:emoji:>`: Adds a reaction
  * `<Contrl + Up arrow>`: Edit your latest message at the current conversation
  * `<Control + n>`: Opens drafts view
  * `<Alt + Left arrow>`: Go to previous conversation


* Creating "easy to land" channels
  * `/invite hyperion` and hyperion will land on a savage full of activity channel
  * Set a title/description so the context is clear
  * Add channel bookmarks (some ideas):
    * External documentation site where the channel effort is being defined/tracked
    * Regular meeting notes document
      * Even at DMs you can add bookmarks: a good place for 1:1 tracking document
    * Any document that channel is usually accessing
    * Team onboarding documentation
  * Create a quick welcome workflow
  * Pinned messages usually get easily outdated, but some people find them useful


* Drafts
  * With `<Shift + Enter>` you can create a multiline Slack message
  * Unexpectly hitting `<Enter>` and sending an unfinished message is a mess
    * You might have notified people
    * Sometimes you can write personal words/messages so you have notes for yourself when reviewing the message
  * For messages mentioning people: write them at drafts section
  * Do not choose the channel/DM you are sending it until the message is ready


* Slack search
  * Easily find and old conversation/thread
  * Go to a channel, `<Control + f>` and the channel scope is automagically set
  * You can filter by `from:@hyperion`
  * Before asking for help, try to search about that message error before
    * Usually someone has faced that already

 
* Create workflows, embrace automation
  * Send welcome messages with context and useful links
  * Send weekly/monthly/yearly reminders
  * Send one-time reminders to the channel like:
    * Upgrade license foo
    * This certificate expires in 2 months
  * Share a workflow with your team so we avoid bus factor
  * Create message templates


* Reminders
  * Set quick reminders for yourself
    * `/remind me to ping hyperion next week`
  * Click on "Remind me about this message"
    * Sometimes you need to track that you had an answer
    * Sometimes we do not have the focus or context to answer something
  * Build workflow for channel reminders and share them with the team


* Interesting integrations
  * Track notifications at a single place: Slack
  * Think about adding these:
    * Google calendar
    * Jira
    * Github
    * Google drive


* Why so serious?
  * These pro-tips above are quite performance oriented
  * But Slack is usually about interacting with humans
  * Slack is our "virtual office" and we want to feel safe and fun in there
    * Enjoy offtopic channels
    * Embrace creative reactions and GIFs (scope and context!)
  * Do not forget every person is different
  * Value people's time


* Shall Slack be always opened?
  * Short answer: NO
  * Usually Slack is a bloody drain of time
  * Some people usually finds a time where Slack is "quiet" for focused work
  * Slack usage is a nice skill, but you are probably there because other skills
  * Just try closing Slack 90-180 minutes a day for "100% focused effort"
    * Do not forget to add that time to your calendar or drop a message so team is aware and aligned
---
