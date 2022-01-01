#!/usr/bin/ruby

require "minitest/autorun"
require 'rexml/document'

require_relative "../../lib/asker-gui/builder/concept_builder"

class ConceptBuilderTest < Minitest::Test

  def setup
    content1 = %q{
      <concept>
        <names>AC/DC, ACDC</names>
        <tags>rock, band, australia</tags>
        <def>Australian rock band</def>
        <table fields='members'>
          <row>Bon Scott</row>
          <row> Angus Young</row>
          <row>Malcolm Young </row>
          <row> Phil Rudd </row>
          <row> Cliff Williams  </row>
        </table>
      </concept>
    }
    xmldata1 = REXML::Document.new(content1).root
    @concept1 = ConceptBuilder.build(xmldata: xmldata1, parent: 'map1')
  end

  def test_concept_parent
    assert_equal 'map1', @concept1.parent
  end

  def test_concept_names
    assert_equal 2, @concept1.names.size
    assert_equal 'AC/DC', @concept1.names[0]
    assert_equal 'ACDC', @concept1.names[1]
  end

  def test_concept_tags
    assert_equal 3, @concept1.tags.size
    assert_equal 'rock', @concept1.tags[0]
    assert_equal 'band', @concept1.tags[1]
    assert_equal 'australia', @concept1.tags[2]
  end

  def test_concept_defs
    assert_equal 1, @concept1.defs.size
    assert_equal 'Australian rock band', @concept1.defs[0].value
    assert_equal '', @concept1.defs[0].type
    assert_equal @concept1, @concept1.defs[0].parent
  end

  def test_concept_tables
    assert_equal 1, @concept1.tables.size
    assert_equal 5, @concept1.tables[0].rows.size
    assert_equal @concept1, @concept1.tables[0].parent
  end
end
