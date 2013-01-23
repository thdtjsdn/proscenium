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
package com.adobe.binary
{
	// ===========================================================================
	//	Imports
	// ---------------------------------------------------------------------------
	import com.adobe.math.Vector4;
	
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	
	// ===========================================================================
	//	Class
	// ---------------------------------------------------------------------------
	final internal class ValueVector4Vector extends ValueObject
	{
		// ======================================================================
		//	Constants
		// ----------------------------------------------------------------------
		public static const TYPE_ID:uint							= TYPE_VECTOR4;
		public static const CLASS_NAME:String						= "ValueVector4Vector";
		
		// ======================================================================
		//	Properties
		// ----------------------------------------------------------------------
		protected var _value:Vector.<Vector.<Number>>;
		
		// ======================================================================
		//	Constructor
		// ----------------------------------------------------------------------
		public function ValueVector4Vector( id:uint, container:GenericBinaryContainer, value:Vector.<Vector.<Number>> )
		{
			super( id, TYPE_ID, container, value );
			_value = value;
		}
		
		// ======================================================================
		//	Methods
		// ----------------------------------------------------------------------
		override internal function write( bytes:ByteArray, referenceTable:GenericBinaryReferenceTable, format:GenericBinaryFormatDescription ):uint
		{
			return writeVector( bytes, TYPE_ID, _value, format );
		}
		
		override internal function writeXML( bytes:ByteArray, referenceTable:GenericBinaryReferenceTable, format:GenericBinaryFormatDescription, xml:XML, tag:uint ):uint
		{
			return writeVectorXML( bytes, TYPE_ID, _value, format, CLASS_NAME, xml, tag );
		}
		
		override public function getVector3DVector():Vector.<Vector3D>
		{
			var count:uint = _value.length;
			
			var result:Vector.<Vector3D> = new Vector.<Vector3D>( count, true );
			
			for ( var i:uint = 0; i < count; i++ )
			{
				var v:Vector.<Number> = _value[ i ];
				result[ i ] = new Vector3D( v[ 0 ], v[ 1 ], v[ 2 ], v[ 3 ] );
			}
			
			return result;
		}
		
		override public function getVector4Vector():Vector.<Vector4>
		{
			var count:uint = _value.length;
			
			var result:Vector.<Vector4> = new Vector.<Vector4>( count, true );
			
			for ( var i:uint = 0; i < count; i++ )
			{
				var v:Vector.<Number> = _value[ i ];
				result[ i ] = new Vector4( v[ 0 ], v[ 1 ], v[ 2 ], v[ 3 ] );
			}
			
			return result;
		}
	}
}
