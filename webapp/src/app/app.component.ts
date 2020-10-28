import { MediaMatcher } from '@angular/cdk/layout';
import { ChangeDetectorRef, Component } from '@angular/core';
import { MenuService } from './shared/menu.service';
import { IMenu } from './shared/models/menu.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  
  private _mobileQueryListener: () => void;
  mobileQuery: MediaQueryList;
  menu: IMenu[] = [];

  constructor(changeDetectorRef: ChangeDetectorRef, media: MediaMatcher, private menuService: MenuService) {
    this.mobileQuery = media.matchMedia('(max-width: 600px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
   }

  ngOnInit(): void {
    this.getMenu();
  }

  ngOnDestroy(): void {
    this.mobileQuery.removeListener(this._mobileQueryListener);
  }

  getMenu(): void {
    this.menu = this.menuService.getMenu();
  }
}
