package com.er453r.neural.mutators;

class LearningWTA extends NeuronMutator{
	private var treshold:Float;

	public function new(treshold:Float = 0.000001){
		this.treshold = treshold;
	}

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

		maxInput.weight += neuron.learning * neuron.value;

		maxInput.weight = maxInput.weight > 1 ? 1 : maxInput.weight;

		// learing signal propagation
		max = 0;

		for(output in neuron.outputs){
			var value:Float = output.output.learning * output.weight;

			if(max < value)
				max = value;
		}

		neuron.learn = max;
	}
}
