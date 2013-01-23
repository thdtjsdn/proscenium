// ============================================================================
//
//  Copyright 2012 Adobe Systems
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
// ============================================================================
package com.adobe.scenegraph.loaders.collada
{
	// ===========================================================================
	//	Class
	// ---------------------------------------------------------------------------
	public class ColladaFloatArray extends ColladaArrayElement
	{
		// ======================================================================
		//	Constants
		// ----------------------------------------------------------------------
		public static const TAG:String								= "float_array";
		
		// ======================================================================
		//	Properties
		// ----------------------------------------------------------------------
		public var values:Vector.<Number>;
		
		public var digits:int;										// @digits		xs:unsignedByte		Optional
		public var magnitude:int;									// @magnitude	xs:short			Optional

		// ======================================================================
		//	Getters and Setters
		// ----------------------------------------------------------------------
		override public function get tag():String { return TAG; }

		// ======================================================================
		//	Constructor
		// ----------------------------------------------------------------------
		public function ColladaFloatArray( arrayList:XMLList )
		{
			var array:XML = arrayList[0];
			super( array );
			if ( !array )
				return;

			digits		= "@digits" in array ? array.@digits : -1;
			magnitude	= "@digits" in array ? array.@magnitude : -1;

			parseValues( array );
		}
		
		// ======================================================================
		//	Methods
		// ----------------------------------------------------------------------
		override protected function fillXML( array:XML ):void
		{
			array.setChildren( values.join( " " ) );

			if ( digits > -1 )
				array.@digits = digits;

			if ( magnitude > -1 )
				array.@magnitude = magnitude;
			
			super.fillXML( array );
		}

		override protected function parseValues( array:XML ):void
		{
			if ( array.hasComplexContent() )
				throw( ColladaArrayElement.ERROR_BAD_FORMAT );
			
			// TODO: Fix, This is really slow for large arrays.
//						var string:String = floatArray.text().toString();
//						values = Vector.<Number>( string.split( /\s+/ ) );
			
			var string:String = array.text().toString()
			string = string.replace( /\s+/g, " " );
			values = Vector.<Number>( string.split( " " ) );
		}
	}
}
