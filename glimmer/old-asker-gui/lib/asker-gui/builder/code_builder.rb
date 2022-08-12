# frozen_string_literal: true

require 'rexml/document'
require_relative '../data/code_data'

module CodeBuilder

  def self.build(args)
    xmldata = args[:xmldata]
    parent = args[:parent]

    path = ''
    type = ''
    features = []
    xmldata.elements.each do |item|
      path = item.text if item.name == 'path'
      type = item.text if item.name == 'type'
      features << read_features(xmldata: item) if item.name == 'features'
    end
    code = CodeData.new(parent: parent,
                        path: path,
                        type: type,
                        features: features)
    code
  end

  private_class_method def self.read_features(args)
    xmldata = args[:xmldata]
    features = []
    xmldata.elements.each do |i|
      features << i.text if i.name == 'row'
    end
    features
  end
end
