package com.er453r.neural.nets;

import haxe.ds.Vector;

interface Network {
	public function getNeurons():Vector<Neuron>;
	public function update():Void;
}
