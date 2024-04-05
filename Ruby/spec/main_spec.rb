require 'main'

describe Main do
  subject(:main) { Main.new }
  it 'should print the correct message' do
    expect(Main.new.print_message).to eq('This is main.rb file in Ruby dojo!')
  end
end
