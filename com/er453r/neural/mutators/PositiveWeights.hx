package com.er453r.neural.mutators;

import com.er453r.neural.Synapse;

class PositiveWeights extends NeuronMutator{
	private var scale:Float;

	public function new(scale:Float = 1.0){
		this.scale = scale;
	}

	override public function onSynapse(synapse:Synapse){
		synapse.weight = scale * Math.random();
	}
}
