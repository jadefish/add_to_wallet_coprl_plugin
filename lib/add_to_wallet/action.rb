module AddToWallet
  class Action < Coprl::Presenters::DSL::Components::Actions::Base
    attr_reader :item

    def initialize(item:, **attributes)
      super(type: :add_to_wallet, **attributes)

      @item = item
    end
  end
end
