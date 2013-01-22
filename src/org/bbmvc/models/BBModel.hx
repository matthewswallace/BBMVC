package org.bbmvc.models;

import org.bbmvc.views.IBBView;
class BBModel implements IBBModel
{
	public function new()
	{
	}

	/**
	 *  
	 *  Holds all the view names registered with the model.
	 */
	private var views : Array<IBBView>;

	// --------------------------------------------------------------------------
	//
	// Properties
	//
	// --------------------------------------------------------------------------
	// --------------------------------------------------------------------------
	// numViews
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  The number of views registered with the model
	 */
	private function getNumViews() : Int
	{
		if (views != null )
			return views.length;
		else
			return 0;
	}

	// --------------------------------------------------------------------------
	//
	// Methods
	//
	// --------------------------------------------------------------------------
	// --------------------------------------------------------------------------
	// addView
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  Adds a view name to the viewNames vector
	 */
	private function addView( view : IBBView ) : Void
	{
		views.push( view );
	}

	// --------------------------------------------------------------------------
	// hasView
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  Checks if a reference to the view is already stored here
	 */
	private function hasView( name : String ) : Bool
	{
		if(views != null)
		{
			for (i in 0...views.length)
			{
				if (views[i].name == name)
					return true;
			}
		}
		return false;
	}

	// --------------------------------------------------------------------------
	// registerView
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  Registers a view with the model for updating
	 */
	public function registerView( view : IBBView ) : Void
	{
		if (views == null)
			views = new Array<IBBView>();
		if (hasView( view.name ))
			throw "Error in Model::registerView - a view with that name already exists.  Cannot add view with duplicate names.";
		else
			addView( view );
	}

	// --------------------------------------------------------------------------
	// removeView
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  Removes a view from the vector
	 */
	private function removeView( view : IBBView ) : Void
	{
		for (i in 0...views.length)
		{
			if (views[i].name == view.name)
			{
				views.splice( i, 1 );
			}
		}
	}

	// --------------------------------------------------------------------------
	// update
	// --------------------------------------------------------------------------
	/**
	 *  
	 *  Tells the views to update themselves
	 */
	private function update( ?dataTypeChanged : String = "", ?data : Dynamic = null ) : Void
	{
		if (views != null)
		{
			for (i in 0...views.length )
				views[i].update( dataTypeChanged, data );
		}
	}

	// --------------------------------------------------------------------------
	// unregisterView
	// --------------------------------------------------------------------------
	/**
	 *  @public
	 *  Unregisters a view with the model
	 */
	public function unregisterView( view : IBBView ) : Void
	{
		removeView( view );
	}
}