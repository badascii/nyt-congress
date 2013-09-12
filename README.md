##Congress-It       [![Code Climate](https://codeclimate.com/github/badascii/NewYorkTimes-CongressAPI.png)](https://codeclimate.com/github/badascii/NewYorkTimes-CongressAPI)

### Ruby Gem for interfacing with The New York Times Congress API
-------------

####Members Methods

######Member Lists
Note: when passing district as an argument, state must also be present.
```
Members.lists(congress_number, chamber, state=nil, district=nil)

    congress_number = 102–113 (House of Representatives)
                       80–113 (Senate)
                       
            chamber = "house" or "senate"
            
   state (optional) = Two-letter state code, ex. "CA", "OR", "NY"
   
district (optional) = House of Representatives district number
```

######Member Bio & Roles
```
Members.bio_and_roles(member_id)

member_id = Alphanumeric
```

######List of New Members
```
Members.new_members
```

######Current Members by State or District
Note: district is only required when querying House members
```
Members.current_members_by_state_or_district(chamber, state, district=nil)

chamber  = "house" or "senate"
state    = Two-letter state code, ex. "CA", "OR", "NY"
district = House of Representatives district number
```

####Votes Methods

######Roll-Call Votes
```
Votes.roll_call(congress_number, chamber, session_number, roll_call_number)
```

######Votes by Type
```
Votes.votes_by_type(congress_number, chamber, vote_type)
```

######Votes by Date

######Nomination Votes
