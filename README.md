Master of dialogue — a plugin for Pintask
=======================

You become a card member upon leaving a comment on http://pintask.me/.

This versatile plugin is only a couple lines of code:

```coffee
if !Cards
  throw "Hey, where are my Cards?"
if !Comments
  throw "Look, I need those Comments, too!"

Comments.after.insert (userId, comment) ->
  cardId = comment.cardId
  card = Cards.findOne(cardId)
  if userId not in card.memberIds
    Cards.update(cardId, {$addToSet: {memberIds: userId}})
```

So easy to make your own plugin ;)
