# Glimmer DSL for LibUI Version 2 (without data-binding):

require 'glimmer-dsl-libui'

module Asker
  module GUI
    include Glimmer

    window('Asker GUI', 500, 300) {

      vertical_box {
        horizontal_box {
          e = entry {
            # stretchy true # Smart default option for appending to horizontal_box
            on_changed do
              puts e.text
              $stdout.flush # For Windows
            end
          }

          button('Button') {
            stretchy false # stretchy property is available when control is nested under horizontal_box
            on_clicked do
              text = e.text
              msg_box('You entered', text)
            end
          }
        }

        non_wrapping_multiline_entry
      }

      on_closing do
        puts 'Bye Bye'
      end
    }.show
  end
end
