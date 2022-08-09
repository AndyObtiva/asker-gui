# Glimmer DSL for LibUI Version 2 (without data-binding):

require 'glimmer-dsl-libui'

module Asker
  module GUI
    class Window
      include Glimmer

      def initialize
      end

      def create_entry
        e = entry {
          stretchy true
        }
        return e
      end

      def create_button(e)
        button('Button') {
          stretchy true
          on_clicked do
            text = e.text
            msg_box('You entered', text)
          end
        }
      end

      def launch
        window('Asker GUI', 500, 300) {
          vertical_box {
            horizontal_box {
              e = create_entry
              create_button(e)
            }
            non_wrapping_multiline_entry
          }

          on_closing do
            puts 'Bye Bye'
          end
        }.show
      end
    end
  end
end
