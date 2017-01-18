package com.er453r.neural.activations;

import com.er453r.neural.Neuron;

class Sigmoid implements Activation{
	private var neuron:Neuron;

	public function new() {
	}

	public function attach(neuron:Neuron){
		this.neuron = neuron;
	}

	public function fire():Float{
		var fired:Float = 0;

		for(input in neuron.inputs)
			fired += input.input.value * input.weight;

		return sigmoid(fired);
	}

	public static function sigmoid(x:Float, beta:Float = 1):Float{
		return (2 / (1 + Math.exp(-(beta * x)))) - 1;
	}
}
