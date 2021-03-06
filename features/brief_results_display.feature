Feature: Brief result display
  In order to be able to pinpoint the item I'm looking for
  As a researcher
  I want to see relevant fields in the brief search display.

  Scenario: Brief results display appropiate fields at the collection level
    Given I am on the brief results page
    When I limit my search to "Archival Collection" under the "Level" category
    And I limit my search to "Mark Bloch Postal Art Network (PAN) Archive" under the "Collection" category
    Then the first result should have a field "Format" with value "Archival Collection"
    Then the first result should have a field "Date range" with value "Inclusive, 1978-2012"
    Then the first result should have a field "Abstract" with value "Mark Bloch is an American fine artist and writer whose work utilizes both visuals and text to explore ideas of long distance communication. This collection contains thousands of examples of original “mail art” sent to and collected by Mark Bloch in New York City from all fifty states and dozens of countries in the form of objects, envelopes, artwork, and enclosures as well as publications, postcards and announcements documenting avant garde cu..."
    Then the first result should have a field "Library" with value "The Fales Library & Special Collections"
    Then the first result should have a field "Call no" with value "MSS 170"
    And the "Abstract" field should be "450" characters or less

  Scenario: Brief results display at the component level
    Given I search on the phrase "Minka"
    Then the first result should have a field "Format" with value "Archival Object"
    Then the first result should have a field "Date range" with value "Oct 26, 1982"
    Then the first result should have a field "Contained in" with value "Oral History of the American Left: Radical Histories >> Minka Alesh"
    Then the first result should have a field "Library" with value "Tamiment Library & Wagner Labor Archives"
    Then the first result should have a field "Collection call no" with value "OH.002"
    Then the first result should have a field "Location" with value "CD: Access OH-02-159, Box: 1, CD: Alesh 1, Cassette: 1, CD: ohaloh020146p1 / /ohaloh020146p2, Box: 1, Cassette: 1"

  Scenario: Link to low level results for the series level components
    Given I search on the phrase "Addendum 7/5/2007"
    Then I should see link "Search all archival materials within this series" within the first result

  Scenario: Link to search all materials within collection launches faceted search
    Given I am on the default search page
    When I limit my search to "Archival Collection" under the "Level" category
    And I limit my search to "Mark Bloch Postal Art Network (PAN) Archive" under the "Collection" category
    When I click on "Search all archival materials within this collection" within the first result
    Then the limit "Archival Collection" should not be selected under the "Level" category
    And the limit "Mark Bloch Postal Art Network (PAN) Archive" should be selected under the "Collection" category
    And I should see search results

  Scenario: Link to search all materials within series launches faceted search
    Given I am on the default search page
    When I limit my search to "Archival Series" under the "Level" category
    When I click on "Search all archival materials within this series" within the first result
    Then the limit "Archival Series" should not be selected under the "Level" category
    Then the limit "Archival Collections" should not be selected under the "Collection" category
    And I should see search results

  Scenario: Link to collection in component result launches faceted search
    Given I search on the phrase "Minka"
    When I click on "Oral History of the American Left: Radical Histories" within the first result
    Then the limit "Oral History of the American Left: Radical Histories" should be selected under the "Collection" category
    And I should see search results

  Scenario: If series doesn't have title then a link to lower level materials is not provided
    Given I search on the phrase "Kopit"
    Then I should see text "Series doesn't have unittitle you can't search within it"

  Scenario: If document doesn't have title display "No Title"
    Given I search on the phrase "Manuscript of novel"
    Then I should see text "No Title"
