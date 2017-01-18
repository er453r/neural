package com.er453r.neural.activations;

interface Activation {
	public function attach(neuron:Neuron):Void;
	public function fire():Float;
}
