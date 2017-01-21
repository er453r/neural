package com.er453r.neural.mutators;

import com.er453r.neural.Synapse;

class SymmetricWeights extends NeuronMutator{
	public function new(){}

	override public function onSynapse(synapse:Synapse){
		synapse.weight = 2 * Math.random() - 1;
	}
}
