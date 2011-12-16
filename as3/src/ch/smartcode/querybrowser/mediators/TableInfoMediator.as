package ch.smartcode.querybrowser.mediators
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
	
	import ch.smartcode.querybrowser.events.TableInfoEvent;
	import ch.smartcode.querybrowser.models.QueryBrowserModel;
	import ch.smartcode.querybrowser.services.QueryRemote;
	import ch.smartcode.querybrowser.views.TableInfoView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TableInfoMediator extends Mediator
	{
		
		[Inject]
		public var service:QueryRemote;
		
		[Inject]
		public var view:TableInfoView;
		
		[Inject]
		public var model:QueryBrowserModel;
		
		override public function onRegister():void
		{
			addContextListener( TableInfoEvent.TABLE_INFO_LOADED,getTableInfoHandler,TableInfoEvent);
			service.getTableInfo();
			
			addViewListener( TableInfoEvent.SET_QUERY,setQueryHandler,TableInfoEvent );
			
		}

		private function setQueryHandler( e:TableInfoEvent ):void
		{
			e.stopImmediatePropagation();
			dispatch( e );
		}

		private function getTableInfoHandler( e:TableInfoEvent ):void
		{
			view.tableInfo = e.data;
		}
	}
}