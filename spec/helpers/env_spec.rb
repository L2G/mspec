require 'spec_helper'

describe 'env helper' do
  before :each do
    ScratchPad.clear

    @saved_env = ENV
    @env = { 'SOMETHING' => 'fnord', 'SOMETHING_ELSE' => 'xxxiii' }
  end

  after :each do
    ENV.replace @saved_env
  end

  context '#replace_env' do
    it 'replaces ENV with the contents of its argument' do
      replace_env @env
      ENV.should eq(@env)
    end

    it 'replaces ENV and yields to a block if provided' do
      replace_env @env do
        ScratchPad.record ENV
      end
      ScratchPad.recorded.should eq(@env)
      ENV.should eq(@saved_env)
    end
  end

  context '#restore_env' do
    example
  end

  context '#save_env' do
    example
  end
end
