import { createReducer, on } from '@ngrx/store';
import { addItem } from './item.actions';

export interface ItemState {
  items: string[];
}

export const initialState: ItemState = {
  items: [],
};

export const itemReducer = createReducer(
  initialState,
  on(addItem, (state, { item }) => ({ ...state, items: [...state.items, item] })),
);
