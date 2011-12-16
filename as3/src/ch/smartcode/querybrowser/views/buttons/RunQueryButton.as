package ch.smartcode.querybrowser.views.buttons
{
	/* 
	Copyright (C) 2011  Rico Leuthold // rico.leuthold@smartcode.ch
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/
	
	import ch.smartcode.querybrowser.events.QueryEvent;
	import ch.smartcode.querybrowser.skins.buttons.RunQueryButtonSkin;
	
	import flash.events.MouseEvent;

	public class RunQueryButton extends IconButton
	{
		public function RunQueryButton()
		{
			super();
			setStyle("skinClass", RunQueryButtonSkin);
			setStyle("paddingLeft", 5);
			setStyle("paddingRight", 5);
			
			addEventListener( MouseEvent.CLICK, buttonClickHandler );
		}
		
		private function buttonClickHandler( e:MouseEvent ):void
		{
			dispatchEvent( new QueryEvent( QueryEvent.EXECUTE_QUERY ) );
		}
	}
}