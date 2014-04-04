require "base"

User = class()

function User:ctor(userid)
    self.userid = userid
    self.cards = {}
end
