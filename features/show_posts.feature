Feature: Show Posts

  Scenario: Home Page
    Given 7 approved posts exist with tag_list: "ror"
    When I go to the home page
    Then I should see 5 posts
    And I should see 7 sections
    And I should see "ror" as keyword
    And I should see blog description as meta tag
    And I should see blog rss
    And I should see "Next" 
    And I should see blog description on page title

    When I follow "Next"
    Then I should see 2 posts
    And I should see "ror" as keyword
    And I should see "Previous" 

  Scenario: Textile
    Given a section exists with name: "About"
    And a post exists with title: "Textile", body: "Simple *textile*", section: the section, tag_list: "ror"
    When I go to Textile's post page
    Then I should see "textile" within "strong"
    And I should see "ror" as keyword
    And I should see section "About" rss
    And I should see "Textile" within "title"

  Scenario: Syntax Highlight 
    Given a section exists with name: "Programming"
    And a post exists with title: "Highlight", body: "<pre><code>def helloworld; end</code></pre>", section: the section
    When I go to Highlight's post page
    Then I should see "helloworld" within "code" 

  Scenario: RSS
    Given 5 approved posts exist
    When I visit "/posts.rss"
    Then I should see 5 rss items
    And I should see blog information 

  Scenario: Section
    Given a section exists with name: "About"
    When I go to "About" section page
    Then I should see "About" within "title"
