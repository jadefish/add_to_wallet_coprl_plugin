module AddToWallet
  class Button < Coprl::Presenters::DSL::Components::Base
    attr_reader :locale, :pass_url

    def initialize(parent:, **attributes, &block)
      super(type: :add_to_wallet_button, parent: parent, &block)

      @locale = attributes.delete(:locale) { :en }.to_s
      @pass_url = attributes.delete(:pass_url)

      unless SUPPORTED_LOCALES.include?(@locale)
        # We don't have SVG button resources for every locale, unfortunately.
        logger.warn("Unsupported locale \"#{@locale}\". Using \"en\" instead.")
        @locale = 'en'
      end

      expand!
    end

    private

    # TODO: intersect apple_wallet set of SVGs with google_pay set and list them here:
    SUPPORTED_LOCALES = %w[ar az bg cn-TW cz de dk ee en es fi fr gr hb hk hu
                           id it jp kr lt lv mt mx my nl no ph pl pt-BR pt ro
                           ru se si sk th tr vn].freeze
  end
end
