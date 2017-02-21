package com.er453r.neural.mutators;

import com.er453r.neural.Synapse;

class FixedWeights extends NeuronMutator{
	private var value:Float;

	public function new(value:Float = 1.0){
		this.value = value;
	}

	override public function onSynapse(synapse:Synapse){
		synapse.weight = value;
	}
}
