package com.er453r.neural;

class Neuron {
	private var inputs:Array<Synapse> = [];
	private var outputs:Array<Synapse> = [];

	public var value:Float = 0;
	public var fired:Float = 0;

	public function new() {

	}

	public function addInput(neuron:Neuron){
		inputs.push(new Synapse(neuron, this));
	}

	public function fire(){
		fired = 0;

		for(input in inputs)
			fired += input.input.value * input.weight;

		fired /= inputs.length;
	}

	public function propagate(){
		value = fired;
	}
}
