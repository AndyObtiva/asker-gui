#!/usr/bin/ruby

require "minitest/autorun"
require 'rexml/document'

require_relative "../../lib/asker-gui/builder/row_builder"

class RowBuilderTest < Minitest::Test

  def setup
    content1 = %q{
          <row>Obiwan</row>
    }
    @xmldata1 = REXML::Document.new(content1).root

    content2 = %q{
          <row>
            <col>race</col>
            <col>human</col>
          </row>
    }
    @xmldata2 = REXML::Document.new(content2).root

    content3 = %q{
          <row>
            <col>The empire strikes back</col>
            <col>empire</col>
            <col>strikes back</col>
          </row>
    }
    @xmldata3 = REXML::Document.new(content3).root
  end

  def test_row1
    r = RowBuilder.build(xmldata: @xmldata1, parent: 'test1')

    assert_equal 'test1', r.parent
    assert_equal 1, r.cols.size
    assert_equal 'Obiwan', r.cols[0]
  end

  def test_row2
    r = RowBuilder.build(xmldata: @xmldata2, parent: 'test2')

    assert_equal 'test2', r.parent
    assert_equal 2, r.cols.size
    assert_equal 'race', r.cols[0]
    assert_equal 'human', r.cols[1]
  end

  def test_row3
    r = RowBuilder.build(xmldata: @xmldata3, parent: 'test3')

    assert_equal 'test3', r.parent
    assert_equal 3, r.cols.size
    assert_equal 'The empire strikes back', r.cols[0]
    assert_equal 'empire', r.cols[1]
    assert_equal 'strikes back', r.cols[2]
  end
end
