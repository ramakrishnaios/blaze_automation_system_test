/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OrganizationsDataList : Codable {
	let ein : Int?
	let strein : String?
	let name : String?
	let sub_name : String?
	let city : String?
	let state : String?
	let ntee_code : String?
	let raw_ntee_code : String?
	let subseccd : Int?
	let has_subseccd : Bool?
	let have_filings : Bool?
	let have_extracts : Bool?
	let have_pdfs : Bool?
	let score : Double?

	enum CodingKeys: String, CodingKey {

		case ein = "ein"
		case strein = "strein"
		case name = "name"
		case sub_name = "sub_name"
		case city = "city"
		case state = "state"
		case ntee_code = "ntee_code"
		case raw_ntee_code = "raw_ntee_code"
		case subseccd = "subseccd"
		case has_subseccd = "has_subseccd"
		case have_filings = "have_filings"
		case have_extracts = "have_extracts"
		case have_pdfs = "have_pdfs"
		case score = "score"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		ein = try values.decodeIfPresent(Int.self, forKey: .ein)
		strein = try values.decodeIfPresent(String.self, forKey: .strein)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		sub_name = try values.decodeIfPresent(String.self, forKey: .sub_name)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		ntee_code = try values.decodeIfPresent(String.self, forKey: .ntee_code)
		raw_ntee_code = try values.decodeIfPresent(String.self, forKey: .raw_ntee_code)
		subseccd = try values.decodeIfPresent(Int.self, forKey: .subseccd)
		has_subseccd = try values.decodeIfPresent(Bool.self, forKey: .has_subseccd)
		have_filings = try values.decodeIfPresent(Bool.self, forKey: .have_filings)
		have_extracts = try values.decodeIfPresent(Bool.self, forKey: .have_extracts)
		have_pdfs = try values.decodeIfPresent(Bool.self, forKey: .have_pdfs)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
	}

}

struct StateWiseOriganizations : Codable
{
    let state : String?
    var organisation : [Organizations]?
    
    init(state:String,organisation:[Organizations]) {
        self.state = state
        self.organisation = organisation
    }
}
