package com.er453r.neural;

class Synapse {
	public var input:Neuron;
	public var output:Neuron;
	public var weight:Float;
	public var dw:Float = 0;

	public function new(input:Neuron, output:Neuron, weight:Float = 0) {
		this.input = input;
		this.output = output;
		this.weight = weight;
	}

	public function getValue():Float{
		return input.value * weight;
	}
}
