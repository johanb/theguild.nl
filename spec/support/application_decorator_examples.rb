shared_examples_for 'application decorator' do
  it 'uses the model class name as Haml object reference' do
    expect(described_class.new('foo').haml_object_ref).to eql('string')
  end
end
