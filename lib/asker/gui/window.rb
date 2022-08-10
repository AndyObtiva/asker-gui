# Glimmer DSL for LibUI Version 2 (without data-binding):

require 'glimmer-dsl-libui'

module Asker
  module GUI
    class Window
      include Glimmer
      attr_accessor :filepath

      def initialize
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
            tab_item("Maps") {}
            tab_item("Concepts") {}
            tab_item("Concept#name") {
              create_form
            }
          }

          on_closing do
            puts 'Bye Bye'
          end
        }.show
      end
    end
  end
end
