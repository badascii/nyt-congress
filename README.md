##Congress-It
===========

### Ruby Gem for interfacing with The New York Times Congress API

###Methods
Members:
Member Lists       - Members.lists(congress_number, chamber, state=nil, district=nil)

                      congress_number = House of Representatives: 102–113
                                                          Senate:  80–113
                              chamber = "house" or "senate"
                     state (optional) = ex. "CA", "OR", "NY"
                  district (optional) =

Member Bio & Roles - Members.bio_and_roles(member_id)

List of New Members
- Members.new_members

Current Members by State or District
- Members.current_members_by_state_or_district(chamber, state, district=nil)