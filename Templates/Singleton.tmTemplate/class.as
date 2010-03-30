package ${TM_CLASS_PATH}
{

	import flash.events.EventDispatcher;

	/**
	 * ${TM_NEW_FILE_BASENAME}.
 	 * Singleton description.
 	 * 
 	 * @langversion ActionScript 3.0
 	 * @playerversion Flash ${TM_PLAYER_VERSION:-9.0}
 	 * 
 	 * @author ${TM_FULLNAME}
 	 * @since ${TM_DATE}
	 * @copyright ${TM_ORGANIZATION_NAME}-${TM_YEAR}
 	 */

	public class ${TM_NEW_FILE_BASENAME} extends EventDispatcher
	{
	
		//--------------------------------------
		// SINGLETON CONSTRUCTOR
		//--------------------------------------
	
		/*  Description */
		private static var _instance:${TM_NEW_FILE_BASENAME};
		
		/**
		 * Description
 		 */
		public static function get instance():${TM_NEW_FILE_BASENAME}
		{
			return initialize();
		}

		/**
		 * Description
 		 */
		public static function initialize():${TM_NEW_FILE_BASENAME}
		{
			if (_instance == null){
				_instance = new ${TM_NEW_FILE_BASENAME}();
			}
			return _instance;
		}

		/* ---------------------------------------------------------------------------------------- */

		
		//---------------------------------------
		// VARIABLES
		//---------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		

		/**
		 * @constructor
		 */
		public function ${TM_NEW_FILE_BASENAME}()
		{
			super();
			if( _instance != null ) throw new Error("Error:${TM_NEW_FILE_BASENAME} already initialised.");
			if( _instance == null ) _instance = this;
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
