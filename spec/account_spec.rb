require './lib/account.rb'

describe Account do
  it 'is expected to have a 4 digit pin number on initialize' do
    pin_lenght = Math.log10(subject.pin_code).to_i + 1
    expect(pin_lenght).to eq 4
  end
end
