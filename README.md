Autojoin plugin for Pintask
=======================

You become a card member upon leaving a comment on http://pintask.me/.

This versatile plugin is only a couple lines of code:

```coffee
if !Cards
  throw "Hey, where are my Cards?"

Cards.before.update (userId, card, fieldNames, modifier, options) ->
  if modifier.$set && userId not in card.memberIds
    for key, value of modifier.$set
      matches = key.match(/^comments\.(\d+)\.isNew$/)
      if matches && value == false && card.comments[matches[1]].ownerId == userId
        modifier.$addToSet = modifier.$addToSet || {}
        modifier.$addToSet.memberIds = userId
```

So easy to make your own plugin ;)
