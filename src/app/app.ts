import { ChangeDetectionStrategy, Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Store } from '@ngrx/store';
import { addItem } from './state/item.actions';
import { ItemState } from './state/item.reducer';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.scss',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class App {
  protected readonly title = signal('angular-starter-project');
  public items$: Observable<string[]>;

  constructor(private store: Store<ItemState>) {}

  public addItem() {
    this.store.dispatch(addItem({ item: 'Your new item' }));
  }
}
