require 'add_to_wallet/action'
require 'add_to_wallet/button'

module Coprl
  module Presenters
    module Plugins
      module AddToWallet
        # These modules correspond to various COPRL plugin "layers" and must remain as submodules of
        # the `Coprl::Presenters::Plugins::AddToWallet` module so COPRL is able to find them.

        module DSLComponents
          def add_to_wallet_button(**attributes, &block)
            self << ::AddToWallet::Button.new(**attributes, parent: self, &block)
          end
        end

        module DSLEventActions
          # thing: apple/google (example)
          # -----------------------------
          # item class: Pass Type Identifier/Class (Event)
          # classes: user defined/boarding passes, event tickets, gift cards, loyalty programs, offers, transit passes, COVID cards
          # item: Pass/Object (Ticket)
          def add_to_wallet(item)
            self << ::AddToWallet::Action.new(item: item, parent: self)
          end
        end

        module WebClientActions
          def action_data_add_to_wallet(action, parent_id, *)
            [action.type, nil, action.options.to_h, action.attributes.to_h]
          end
        end

        module WebClientComponents
          def view_dir_add_to_wallet(_)
            File.join(__dir__, '../../../../', 'views', 'components')
          end

          def render_header_add_to_wallet(pom, render:)
            render.call :erb, :add_to_wallet_header, views: view_dir_add_to_wallet(pom)
          end

          def render_add_to_wallet_button(comp, render:, components:, index:)
            render.call :erb, :add_to_wallet_button,
                        views: view_dir_add_to_wallet(comp),
                        locals: {comp: comp, components: components, index: index}
          end
        end
      end
    end
  end
end
