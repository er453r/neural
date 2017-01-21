package com.er453r.neural.mutators;

class Sigmoid extends NeuronMutator{
	public function new(){}

	override public function onStep(neuron:Neuron){
		var fired:Float = 0;

		for(input in neuron.inputs)
			fired += input.getValue();

		neuron.fired = sigmoid(fired);
	}

	public static function sigmoid(x:Float, beta:Float = 1):Float{
		return (2 / (1 + Math.exp(-(beta * x)))) - 1;
	}
}
