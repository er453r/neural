package com.er453r.neural.mutators;

class ReinforcementWTALearning extends NeuronMutator{
	public function new(){}

	override public function onStep(neuron:Neuron){
		// weight modificaiton propagation
		var max:Float = 0;
		var maxInput:Synapse = neuron.inputs[0];

		for(input in neuron.inputs){
			var value:Float = input.getValue();

			if(max < value){
				max = value;
				maxInput = input;
			}
		}

		maxInput.weight += neuron.learning * neuron.value * 1000000;
		maxInput.weight = maxInput.weight > 1 ? 1 : maxInput.weight;

		neuron.learn = maxInput.input.learning * maxInput.weight;
	}
}
