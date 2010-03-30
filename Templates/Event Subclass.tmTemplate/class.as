package ${TM_CLASS_PATH}
{

	import flash.events.Event;

	/**
	 * ${TM_NEW_FILE_BASENAME}.
 	 * Event subclass description.
 	 * 
 	 * @langversion ActionScript 3.0
 	 * @playerversion Flash ${TM_PLAYER_VERSION:-9.0}
 	 * 
 	 * @author ${TM_FULLNAME}
 	 * @since ${TM_DATE}
	 * @copyright ${TM_ORGANIZATION_NAME}-${TM_YEAR}
 	 */

	public class ${TM_NEW_FILE_BASENAME} extends Event
	{
	
		//---------------------------------------
		// VARIABLES
		//---------------------------------------
		
		
		/*  Description  */
		public static const EVENT_NAME:String = "${TM_NEW_FILE_BASENAME}.EVENT_NAME";
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------


		/**
		 * @constructor
		 */
		public function ${TM_NEW_FILE_BASENAME}(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
		}

		/**
		 * Description
 		 */
		override public function clone():Event
		{
			return new ${TM_NEW_FILE_BASENAME}(type, bubbles, cancelable);
		}

				//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------

		//--------------------------------------
		//  PRIVATE & PROTECTED  METHODS
		//--------------------------------------

	
	}

}
