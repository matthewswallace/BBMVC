package org.bbmvc.models;

import org.bbmvc.views.IBBView;

interface IBBModel 
{
	/**
	 * Registers the view with the model so it can be notified when to update
	 */
	function registerView(view:IBBView):Void;
	
	/**
	 * Unregister a view so the reference is removed.
	 */
	function unregisterView(view:IBBView):Void;
}
