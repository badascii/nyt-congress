class API
  include HTTParty
  include active_model_serializers


  # ENV.fetch("API_KEY")
  # throws an error if ENV variable cannot be found
  # optionally takes a block

  BASE_URI = "http://api.nytimes.com/svc/politics/#{VERSION}/us/legislative/congress/"

  # Set to either .xml or .json
  FORMAT = ".xml"

  # V3 is currently the only supported version
  VERSION = "v3"

  # Set your API key as the value of this variable
  API_KEY = "lol"

  def self.build_uri(api_method)
    BASE_URI + api_method + FORMAT + "?api-key=" + API_KEY
  end

  def self.get_response(api_method)
    uri = self.build_uri(api_method)
    response = HTTParty.get(uri)
  end

  def self.parse_xml(api_method)
    response = self.get_response(api_method)
    @parsed_xml = XML.parse(response)
  end

end


class Members < API

  # Example: http://api.nytimes.com/svc/politics/v3/us/legislative/congress/109/house/members?state=CA&district=4.xml
  def self.lists(congress_number, chamber, state=nil, district=nil)
    if state.nil? && district.nil?
      "#{congress_number}/#{chamber}/members#{FORMAT}&api-key=#{API_KEY}"
    elsif state.nil?
      # FIXME: raise exception when district is passed as an argument without a state also
    else
      "#{congress_number}/#{chamber}/members?state=#{state}&district=#{district}#{FORMAT}&api-key=#{API_KEY}"
    end
  end

  def self.bio_and_roles(member_id)
    "members/#{member_id}"
  end

  def self.new_members
    "members/new"
  end

  def self.current_members_by_state_or_district(chamber, state, district=nil)
    if (chamber.downcase == "house" && district.nil?)
      # FIXME: raise exception when house is passed as an argument without a district also
    elsif chamber.downcase == "senate"
      "members/senate/#{state}/current"
    else
      "members/house/#{state}/#{district}/current"
    end
  end

  def self.leaving_office(congress_number, chamber)
    "#{congress_number}/#{chamber}/members/leaving"
  end

  def self.vote_positions(member_id)
    "members/#{member_id}/votes"
  end

  def self.vote_comparison(first_member_id, second_member_id, congress_number, chamber)
    "members/#{first_member_id}/votes/#{second_member_id}/#{congress_number}/#{chamber}"
  end

  def self.bills_cosponsored(member_id, type)
    "members/#{member_id}/bills/#{type}"
  end

  def self.sponsorship_comparison(member_id_1, member_id_2, congress_number, chamber)
    "members/#{member_id_1}/bills/#{member_id_2}/#{congress_number}/#{chamber}"
  end

  def self.floor_appearances(member_id)
    "members/#{member_id}/floor_appearances"
  end

end


class Votes < API

  def self.roll_call(congress_number, chamber, session_number, roll_call_number)
    "#{congress_number}/#{chamber}/sessions/#{session_number}/votes/#{roll-call-number}"
  end

  def self.votes_by_type(congress_number, chamber, vote_type)
    "#{congress_number}/#{chamber}/votes/#{vote_type}"
  end

  def self.by_month(chamber, year, month)
    "#{chamber}/votes/#{year}/#{month}"
  end

  def self.by_date_range(chamber, start_date, end_date)
    "#{chamber}/votes/#{start_date}/#{end_date}"
  end

  def self.senate_nomination_votes(congress_number)
    "#{congress_number}/nominations"
  end

end

class Bills < API
  # TODO: use this technique to allow for leaving out self in method names
  #
  # class << self
  # end

  def self.recent_bills
    "#{congress_number}/#{chamber}/bills/#{type}"
  end

  def self.bills_by_member
    "members/#{member_id}/bills/#{type}"
  end

  def self.bill_details(congress_number, bill_id)
    "#{congress_number}/bills/#{bill_id}"
  end

  def self.subjects_amendments_and_related_bills(congress_number, bill_id, resource)
    "#{congress_number}/bills/#{bill_id}/#{resource}"
  end

  def self.cosponsors(congress_number, bill_id)
    "#{congress_number}/bills/#{bill_id}/cosponsors"
  end

end

class Nominees < API

  def self.lists(congress_number, nomination_category)
    "#{congress_number}/nominees/#{nomination_category}"
  end

  def self.details(congress_number, nominee_id)
    "#{congress_number}/nominees/#{nominee_id}"
  end

  def self.by_state(congress_number, state)
    "#{congress_number}/nominees/state/#{state}"
  end

end

class Other < API

  def state_party_counts
    "states/members/party"
  end

  def committees_and_rosters(congress_number, chamber, committee_id=nil)
    if committee_id.nil?
      "#{congress-number}/#{chamber}/committees"
    else
      "#{congress_number}/#{chamber}/committees/#{committee_id}"
    end
  end

  def chamber_schedule(chamber)
    "#{chamber}/schedule"
  end
end
