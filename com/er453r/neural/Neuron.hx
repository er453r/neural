package com.er453r.neural;

class Neuron {
	private var inputs:Array<Synapse> = [];
	private var outputs:Array<Synapse> = [];

	public var value:Float = 0;

	public function new() {
		value = Math.random();
	}

	public function addInput(neuron:Neuron){
		inputs.push(new Synapse(neuron, this));
	}
}
