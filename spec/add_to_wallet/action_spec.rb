describe AddToWallet::Action do
  subject { described_class.new(item: item, parent: parent) }
  let(:item) { double(title: 'test') }
  let(:type) { 'boarding_pass' }
  let(:parent) { double(_plugins_: []) }

  it 'initializes' do
    expect(subject).to have_attributes(item: item, type: :add_to_wallet)
  end
end
