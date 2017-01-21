package com.er453r.neural.mutators;

class WTA extends NeuronMutator{
	public function new(){}

	override public function onStep(neuron:Neuron){
		var max:Float = 0;

		for(input in neuron.inputs){
			var value:Float = input.getValue();

			if(max < value)
				max = value;
		}

		neuron.fired = max;
	}
}
