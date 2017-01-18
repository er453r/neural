package com.er453r.neural.activations;

import com.er453r.neural.Neuron;

class WTA implements Activation{
	private var neuron:Neuron;

	public function new() {
	}

	public function attach(neuron:Neuron){
		this.neuron = neuron;
	}

	public function fire():Float{
		var max:Float = 0;

		for(input in neuron.inputs)
			if(max < input.input.value)
				max = input.input.value;

		return max;
	}
}
