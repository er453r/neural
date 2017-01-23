package com.er453r.neural.mutators;

class LearningWTA extends NeuronMutator{
	private var treshold:Float;

	public function new(treshold:Float = 0.000001){
		this.treshold = treshold;
	}

	override public function onStep(neuron:Neuron){
		var max:Float = 0;

		for(input in neuron.inputs){
			var value:Float = input.input.learning * neuron.value;

			if(max < value)
				max = value;
		}

		neuron.learn = max;
	}
}
