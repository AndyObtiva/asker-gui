# Glimmer DSL for LibUI Version 2 (without data-binding):

require 'glimmer-dsl-libui'

module Asker
  module GUI
    class Window
      include Glimmer
      attr_accessor :filepath

      def initialize
      end

      def create_maplist
        data = [
          %w[cat.haml open],
          %w[dog.xml open],
          %w[chicken.xml open],
          %w[horse.haml open],
          %w[cow.haml open]
        ]

        horizontal_box {
          table {
            text_column('Filename')
            button_column('Action')
            cell_rows data

            on_edited do |row, row_data| # only fires on direct table editing
              puts "Row #{row} edited: #{row_data}"
            end
          }
        }
      end

      def create_form
        vertical_box {
          horizontal_box {
            label 'Concept'
            button('Salir') {
              stretchy true
              on_clicked do
                msg_box('You entered', @filepath)
              end
            }
            button("Add")
          }

          form {
            stretchy false
            entry {
              label 'Name'
              text <=> [self, :filepath]
            }
            entry {
              label 'Tags'
              text <=> [self, :filepath]
            }
          }
        }
      end

      def launch
        window('Asker GUI', 500, 300) { |w|
          tab {
            tab_item("Maps") { create_maplist }
            tab_item("Concepts") {}
            tab_item("Concept#name") { create_form }
          }

          on_closing do
            puts 'Bye Bye'
          end
        }.show
      end
    end
  end
end
