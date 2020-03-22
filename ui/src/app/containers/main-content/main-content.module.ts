import { NgModule } from "@angular/core";
import { NavigationComponent } from "./navigation/navigation.component";
import { MainContentComponent } from "./main-content.component";
import { NavigationCartComponent } from "./navigation/navigation-cart/navigation-cart.component";

@NgModule({
  declarations: [
    NavigationComponent,
    MainContentComponent,
    NavigationCartComponent
  ],
  imports: [],
  exports: [
    MainContentComponent
  ],
  providers: []
})

export class MainContentModule {}
