package com.er453r.neural.mutators;

class Decay extends NeuronMutator{
	private var treshold:Float;
	private var decay:Float;

	public function new(treshold:Float = 0.01, decay:Float = 0.9){
		this.treshold = treshold;
		this.decay = decay;
	}

	override public function onStep(neuron:Neuron){
		if(neuron.value > treshold)
			neuron.fired = neuron.value * decay;
	}
}
