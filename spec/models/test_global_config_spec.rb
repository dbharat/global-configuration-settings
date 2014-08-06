require 'spec_helper'

describe TestGlobalConfig do
  describe 'values with type' do
    let(:config_string)  { create :test_global_config }
    let(:config_integer) { create :test_global_config_integer }
    let(:config_float) { create :test_global_config_float }
    let(:config_boolean) { create :test_global_config_boolean, value: 'true' }

    it { expect(config_string.value_with_type).to be_a(String) }
    it { expect(config_integer.value_with_type).to be_a(Integer) }
    it { expect(config_float.value_with_type).to be_a(Float) }
    it { expect(config_boolean.value_with_type).to be_a(TrueClass) }
  end

  describe 'Read settings' do
    let(:config)  { create :test_global_config }

    it { expect(TestGlobalConfig[:random_nonexistent_name]).to be_nil }
    it { expect(TestGlobalConfig[config.name]).to eq config.value }
  end

  describe 'Write settings' do
    before :each do
      Rails.cache.clear
    end

    it 'save string setting' do
      expect(TestGlobalConfig[:test]).to be_nil
      TestGlobalConfig[:test] = 'test'
      expect(TestGlobalConfig[:test]).to eq 'test'
    end

    it 'save integer setting' do
      TestGlobalConfig[:test] = 100
      expect(TestGlobalConfig[:test]).to eq 100
    end

    it 'save float setting' do
      TestGlobalConfig[:test] = 100.99
      expect(TestGlobalConfig[:test]).to eq 100.99
    end

    it 'save boolean setting' do
      TestGlobalConfig[:test] = true
      expect(TestGlobalConfig[:test]).to eq true
    end
  end
end