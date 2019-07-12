require 'spec_helper'

shared_examples_for 'read-only' do
  it 'is frozen after loading from the database' do
    instance = described_class.first
    expect(instance).to be_frozen
    expect do
      instance.send(:"#{instance.attributes.keys.sample}=", nil)
    end.to raise_error(RuntimeError, "Can't modify frozen hash")
  end

  it 'still allows setting attributes on new instances' do
    instance = described_class.new
    expect(instance).to_not be_frozen
    expect do
      instance.send(:"#{instance.attributes.keys.sample}=", nil)
    end.to_not raise_error
  end

  it 'disallows saving, deleting, or destroying' do
    instance = described_class.first
    %i[save delete destroy].each do |action|
      expect do
        instance.send(action)
      end.to raise_error(ActiveRecord::ReadOnlyRecord)
      expect do
        instance.send(:"#{action}!")
      end.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end
