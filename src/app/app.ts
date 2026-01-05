import { ChangeDetectionStrategy, Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Store } from '@ngrx/store';
import { addItem } from './state/item.actions';
import { ItemState } from './state/item.reducer';

import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTableModule } from '@angular/material/table';

export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  { position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H' },
  { position: 2, name: 'Helium', weight: 4.0026, symbol: 'He' },
  { position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li' },
];

@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    MatButtonModule,
    MatCardModule,
    MatIconModule,
    MatSnackBarModule,
    MatTableModule,
  ],
  templateUrl: './app.html',
  styleUrl: './app.scss',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class App {
  protected readonly title = signal('angular-starter-project');
  public displayedColumns: string[] = ['position', 'name', 'weight', 'symbol'];
  public dataSource = ELEMENT_DATA;

  constructor(
    private store: Store<ItemState>,
    private snackBar: MatSnackBar,
  ) {}

  public addItem() {
    this.store.dispatch(addItem({ item: 'Your new item' }));
  }

  public openSnackbar(): void {
    this.snackBar.open('This is a snackbar with custom theme!', 'Close', {
      duration: 3000,
    });
  }
}
