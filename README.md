## Instructions

To run specs:

 `bundle install`
 `rspec`

 ## Explanation

 Solution allows to use json schema [standard](https://datatracker.ietf.org/doc/html/draft-wright-json-schema-01) to create schema for expected results
 This allow for easy validation of results in specs with json-schema gem

 ### Weaknesses

1. It require to download images from google server (Right now in synchronous way)
- We can use some parallelism (forks, faraday gem e.t.c)
- We can use capybara to execute javascript (javascript will fill image src with base64 value without external request) (Recommended)
- We can write js script parser to extract base64 images.

2. Html structure changes
- Remove carousel element xpath and make it more generic (ex. div including img and text) component template definition (there is no carrousel element in the new google search page )

3. Code refactoring
- Remove nokogiri related parsing from schema objects as it will allow to write custom parser for example using [ox gem](https://github.com/ohler55/ox)
- Write more specs

4. Extend JSON Schema usage
- use 'required' attribute instead of hardcoded values 