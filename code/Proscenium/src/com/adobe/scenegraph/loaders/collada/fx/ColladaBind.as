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
package com.adobe.scenegraph.loaders.collada.fx
{
	// ===========================================================================
	//	Class
	// ---------------------------------------------------------------------------
	public class ColladaBind
	{
		// ======================================================================
		//	Constants
		// ----------------------------------------------------------------------
		public static const TAG:String								= "bind";
		
		// ======================================================================
		//	Properties
		// ----------------------------------------------------------------------	
		public var semantic:String;									// @semantic	xs:NCName		Required
		public var target:String;									// @target		sidref_type		Required
		
		// ======================================================================
		//	Constructor
		// ----------------------------------------------------------------------	
		public function ColladaBind( element:XML )
		{
			if ( !element )
				return;
			
			semantic	= element.@semantic;
			target		= element.@target;
		}
		
		// ======================================================================
		//	Methods
		// ----------------------------------------------------------------------
		public function toXML():XML
		{
			var result:XML = new XML( "<" + TAG + "/>" );
			
			result.@semantic	= semantic;
			result.@target		= target;
			
			return result;
		}
		
		public static function parseBinds( binds:XMLList ):Vector.<ColladaBind>
		{
			var length:uint = binds.length();
			if ( length == 0 )
				return null;
			
			var result:Vector.<ColladaBind> = new Vector.<ColladaBind>();
			for each ( var bind:XML in binds ) {
				result.push( new ColladaBind( bind ) );
			}
			
			return result;
		}
	}
}
