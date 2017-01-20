package com.er453r.neural;

class Synapse {
	public var input:Neuron;
	public var output:Neuron;
	public var weight:Float;

	public function new(input:Neuron, output:Neuron, weight:Float) {
		this.input = input;
		this.output = output;
		this.weight = weight;
	}
}
