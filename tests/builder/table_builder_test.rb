#!/usr/bin/ruby

require "minitest/autorun"
require 'rexml/document'

require_relative "../../lib/asker-gui/builder/table_builder"

class TableBuilderTest < Minitest::Test

  def setup
    content1 = %q{
      <table fields="starwars characters">
        <row>Obiwan</row>
        <row>Yoda</row>
      </table>
    }
    @xmldata1 = REXML::Document.new(content1).root

    content2 = %q{
      <table fields="attribute,value">
        <row>
          <col>race</col>
          <col>human</col>
        </row>
      </table>
    }
    @xmldata2 = REXML::Document.new(content2).root

    content3 = %q{
      <table fields="name" sequence="steps">
        <row>step1</row>
        <row>step2</row>
        <row>step3</row>
      </table>
    }
    @xmldata3 = REXML::Document.new(content3).root
  end

  def test_table1
    t = TableBuilder.build(xmldata: @xmldata1, parent: 'concept1')

    assert_equal 'concept1', t.parent
    assert_equal 1, t.fields.size
    assert_equal 'starwars characters', t.fields[0]
    assert_equal 0, t.sequence.size

    assert_equal 2, t.rows.size
    assert_equal 'Obiwan', t.rows[0].cols[0]
    assert_equal 'Yoda', t.rows[1].cols[0]

    assert_equal 1, t.rows[0].cols.size
    assert_equal 1, t.rows[1].cols.size

    assert_equal t, t.rows[0].parent
    assert_equal t, t.rows[1].parent
  end

  def test_table2
    t = TableBuilder.build(xmldata: @xmldata2, parent: 'concept2')

    assert_equal 'concept2', t.parent
    assert_equal 2, t.fields.size
    assert_equal 'attribute', t.fields[0]
    assert_equal 'value', t.fields[1]
    assert_equal 0, t.sequence.size

    assert_equal 1, t.rows.size
    assert_equal 'race', t.rows[0].cols[0]
    assert_equal 'human', t.rows[0].cols[1]

    assert_equal 2, t.rows[0].cols.size

    assert_equal t, t.rows[0].parent
  end

  def test_table3
    t = TableBuilder.build(xmldata: @xmldata3, parent: 'concept3')

    assert_equal 'concept3', t.parent
    assert_equal 1, t.fields.size
    assert_equal 'name', t.fields[0]
    assert_equal 'steps', t.sequence

    assert_equal 3, t.rows.size
    assert_equal 'step1', t.rows[0].cols[0]
    assert_equal 'step2', t.rows[1].cols[0]
    assert_equal 'step3', t.rows[2].cols[0]

    assert_equal 1, t.rows[0].cols.size

    assert_equal t, t.rows[0].parent
    assert_equal t, t.rows[1].parent
    assert_equal t, t.rows[2].parent
  end

end
