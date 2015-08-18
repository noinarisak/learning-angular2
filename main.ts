/// <reference path="typings/angular2/angular2.d.ts" />
import {Component, View, bootstrap} from 'angular2/angular2';
import {DisplayComponent} from './show-properties';

@Component({
  selector: 'my-app'
})
@View({
  templateUrl: './layout.html',
  directives: [
    DisplayComponent
  ]
})
class AppComponent {
}

bootstrap(AppComponent);