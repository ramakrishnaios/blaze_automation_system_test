/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OrganizationsResponse : Codable {
	let total_results : Int?
	let organizations : [OrganizationsDataList]?
	let num_pages : Int?
	let cur_page : Int?
	let page_offset : Int?
	let per_page : Int?
	let search_query : String?
	let selected_state : String?
	let selected_ntee : String?
	let selected_code : String?
	let data_source : String?
	let api_version : Int?

	enum CodingKeys: String, CodingKey {

		case total_results = "total_results"
		case organizations = "organizations"
		case num_pages = "num_pages"
		case cur_page = "cur_page"
		case page_offset = "page_offset"
		case per_page = "per_page"
		case search_query = "search_query"
		case selected_state = "selected_state"
		case selected_ntee = "selected_ntee"
		case selected_code = "selected_code"
		case data_source = "data_source"
		case api_version = "api_version"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
		organizations = try values.decodeIfPresent([OrganizationsDataList].self, forKey: .organizations)
		num_pages = try values.decodeIfPresent(Int.self, forKey: .num_pages)
		cur_page = try values.decodeIfPresent(Int.self, forKey: .cur_page)
		page_offset = try values.decodeIfPresent(Int.self, forKey: .page_offset)
		per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
		search_query = try values.decodeIfPresent(String.self, forKey: .search_query)
		selected_state = try values.decodeIfPresent(String.self, forKey: .selected_state)
		selected_ntee = try values.decodeIfPresent(String.self, forKey: .selected_ntee)
		selected_code = try values.decodeIfPresent(String.self, forKey: .selected_code)
		data_source = try values.decodeIfPresent(String.self, forKey: .data_source)
		api_version = try values.decodeIfPresent(Int.self, forKey: .api_version)
	}

}
