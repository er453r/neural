package com.er453r.neural;

class Neuron {
	public var inputs:Array<Synapse> = [];
	public var outputs:Array<Synapse> = [];

	private var mutators:Array<NeuronMutator>;

	public var value:Float = 0;
	public var fired:Float = 0;

	public var learn:Float = 0;
	public var learning:Float = 0;

	public function new(mutators:Array<NeuronMutator>) {
		this.mutators = mutators;

		for(mutator in mutators)
			mutator.onInit(this);
	}

	public function addInput(neuron:Neuron){
		var synapse:Synapse = new Synapse(neuron, this);

		for(mutator in mutators)
			mutator.onSynapse(synapse);

		inputs.push(synapse);
	}

	public function step(){
		for(mutator in mutators)
			mutator.onStep(this);
	}
	
	public function propagate(){
		value = fired;
		learning = learn;
	}
}
