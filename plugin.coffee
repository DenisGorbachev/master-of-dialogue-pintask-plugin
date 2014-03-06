if !Cards
  throw "Hey, where are my Cards?"
if !Comments
  throw "Look, I need those Comments, too!"

Comments.after.insert (userId, comment) ->
  cardId = comment.cardId
  card = Cards.findOne(cardId)
  if userId not in card.memberIds
    Cards.update(cardId, {$addToSet: {memberIds: userId}})
