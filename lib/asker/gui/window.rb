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
        form {
          stretchy false
          entry {
            label 'Filepath'
            text <=> [self, :filepath]
          }
        }
      end

      def create_button
        button('Button') {
          stretchy false
          on_clicked do
            msg_box('You entered', @filepath)
          end
        }
      end

      def launch
        window('Asker GUI') { |w|
          # margined true

          #vertical_box {
            horizontal_box {
              create_form
              create_button
            }
            #non_wrapping_multiline_entry
          #}

          on_closing do
            puts 'Bye Bye'
          end
        }.show
      end
    end
  end
end
