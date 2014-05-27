##NYT Congress API [![Code Climate](https://codeclimate.com/github/badascii/nyt-congress.png)](https://codeclimate.com/github/badascii/nyt-congress)

##### Simple querying of The New York Times Congress API
-------------------

####Available Methods:
===================
###Member Queries
#####Member Lists

```ruby
Members.lists(congress_number, chamber, state=nil, district=nil)
```
```
    congress_number = 102–113 (House of Representatives)
                       80–113 (Senate)
            chamber = "house" or "senate"
   state (optional) = Two-letter state code, ex. "CA", "OR", "NY"
district (optional) = House of Representatives district number
```
######Notes 
When passing district as an argument, state must also be present.

#####Member Bio & Roles
```ruby
Members.bio_and_roles(member_id)
```
```
member_id = Alphanumeric
```
######Notes
member_id is returned by the Members.lists method.

#####List New Members
```ruby
Members.new_members
```

#####Current Members by State or District
```ruby
Members.current_members_by_state_or_district(chamber, state, district=nil)
```
```
chamber  = "house" or "senate"
state    = Two-letter state code, ex. "CA", "OR", "NY"
district = House of Representatives district number
```
######Notes
District is only required when querying House members.

###Vote Queries
#####Roll-Call Votes
```ruby
Votes.roll_call(congress_number, chamber, session_number, roll_call_number)
```
```
 congress_number = 102–113 (House of Representatives)
                    80–113 (Senate)
         chamber = "house" or "senate"
  session_number = 1 | 2 | [special session number]
roll_call_number = Integer
```
######Notes
A detailed list of Congressional Sessions and their numbers can be found at this address:
```
http://www.senate.gov/reference/resources/pdf/congresses2.pdf
```
Roll-call numbers can be found on the official U.S. Senate and House websites:
```
Senate: http://www.senate.gov/pagelayout/legislative/a_three_sections_with_teasers/votes.htm
 House: http://clerk.house.gov/art_history/house_history/index.html
```


#####Votes by Type
```ruby
Votes.votes_by_type(congress_number, chamber, vote_type)
```
```
congress_number = 102–113 (House of Representatives)
                       80–113 (Senate)
        chamber = "house" or "senate"
        chamber = "house" or "senate"
      vote_type = missed_votes | party_votes | loneno | perfect
```
######Notes

missed_votes: information about the voting attendance of each member of chamber and congress-number.

party_votes: information about each member's voting behavior with respect to his or her party (the member must have voted at least once).

loneno: for each member of chamber and congress-number, this response lists the number of times the member was the only person to vote No.

perfect: lists the members of chamber and congress-number who voted Yes or No on every vote for which he or she was eligible.

For more information, see Data Returned:
```
http://developer.nytimes.com/docs/congress_api#votes-by-type-data-returned
```

#####Votes by Date
```ruby
Votes.by_month(chamber, year, month)
```
```
chamber = "house" or "senate"
year    =
month   = 
```

######Notes

Takes either a single date or a range of dates.

#####Nomination Votes
```ruby
Votes.senate_nomination_votes(congress_number)
```
```
congress_number = 
```

###Bill Queries
#####Recent Bills
```ruby
Bills.recent
```

#####Bills by Member
```ruby
Bills.by_member
```

#####Bill Details
```ruby
Bills.bill_details(congress_number, bill_id)
```

#####Bill Subjects/Amendments and Related Bills
```ruby
Bills.subjects_amendments_and_related_bills(congress_number, bill_id, resource)
```

#####Bill Cosponsors
```ruby
Bills.cosponsors(congress_number, bill_id)
```
