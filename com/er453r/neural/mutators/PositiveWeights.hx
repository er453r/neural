package com.er453r.neural.mutators;

import com.er453r.neural.Synapse;

class PositiveWeights extends NeuronMutator{
	public function new(){}

	override public function onSynapse(synapse:Synapse){
		synapse.weight = Math.random();
	}
}
