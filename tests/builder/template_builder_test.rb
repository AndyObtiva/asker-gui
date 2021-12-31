#!/usr/bin/ruby

require "minitest/autorun"
require 'rexml/document'

require_relative "../../lib/asker-gui/builder/template_builder"

class TemplateBuilderTest < Minitest::Test

  def setup
    content1 = %q{
      <template IP="127.0.0.1,localhost">
        <row>
          <col>ping IP</col>
          <col>Test IP host</col>
        </row>
      </template>
    }
    @xmldata1 = REXML::Document.new(content1).root
  end

  def test_template1
    t = TemplateBuilder.build(xmldata: @xmldata1, parent: 'table1')

    assert_equal 'table1', t.parent
    assert_equal 'IP', t.var_name
    assert_equal 2, t.var_values.size
    assert_equal '127.0.0.1', t.var_values[0]
    assert_equal 'localhost', t.var_values[1]

    assert_equal 1, t.rows.size
    assert_equal 2, t.rows[0].cols.size

    assert_equal 'ping IP', t.rows[0].cols[0]
    assert_equal 'Test IP host', t.rows[0].cols[1]

    assert_equal t, t.rows[0].parent
  end

end
