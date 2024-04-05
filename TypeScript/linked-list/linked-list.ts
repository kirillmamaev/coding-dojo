export class LinkedList<T> {
  private _head: Node<T> | null = null;
  private _tail: Node<T> | null = null;

  get head(): Node<T> | null {
    return this._head;
  }

  get tail(): Node<T> | null {
    return this._tail;
  }

  get length(): number {
    let nodeCounter = 0;
    this.traverse(() => nodeCounter++);
    return nodeCounter;
  }

  traverse(callback: (node: Node<T>) => void): void {
    let node = this._head;
    while (node) {
      callback(node);
      node = node.next;
    }
  }

  add(data: T): void {
    const newNode = new Node<T>(data, this._tail);

    if (!this._head) {
      this._head = newNode;
      this._tail = this._head;
      return;
    }

    if (this._tail) {
      this._tail.next = newNode;
    }
    this._tail = newNode;
  }

  resetList(): void {
    this._head = null;
    this._tail = null;
  }

  deleteFirst(): void {
    if (!this._head) return;

    if (this._head === this._tail) {
      this.resetList();
      return;
    }

    if (this._head?.next) {
      this._head = this._head.next;
      this._head.previous = null;
    }
  }

  deleteLast(): void {
    if (!this._tail) return;

    if (this._tail === this._head) {
      this.resetList();
      return;
    }

    if (this._tail?.previous) {
      this._tail = this._tail.previous;
      this._tail.next = null;
    }
  }

  nodeAtIndex(index: number): Node<T> | null {
    if (!this._head) return null;

    if (index < 1 || index > this.length) {
      throw new Error('Index is out of bounds.');
    }

    let node = this._head;
    let currentIndex = 1;
    while (node.next && currentIndex < index) {
      node = node.next;
      currentIndex++;
    }
    return node;
  }

  find(comparator: (data: T) => boolean): Node<T> | null {
    let node = this.head;
    while (node) {
      if (comparator(node.data)) {
        return node;
      }
      node = node.next;
    }
    return null;
  }

  deleteByIndex(targetIndex: number): void {
    if (targetIndex === 1) {
      this.deleteFirst();
      return;
    }

    let node = this.nodeAtIndex(targetIndex);

    if (!node?.next) {
      this.deleteLast();
      return;
    }

    if (node.previous && node.next) {
      [ node.previous.next, node.next.previous ] = [ node.next, node.previous ];
    }
  }

  insert(targetIndex: number, data: T): void {
    if (targetIndex === this.length + 1) {
      this.add(data);
      return;
    }

    const newNode = new Node(data, null, this._head);

    if (targetIndex === 1) {
      this._head = newNode;
      return;
    }

    let node = this.nodeAtIndex(targetIndex);
    if (node?.previous) {
      newNode.previous = node.previous;
      newNode.next = node;
      node.previous.next = newNode;
      node.previous = newNode;
    }
  }

  reverse(): void {
    if (!this._head || this._head === this._tail) return;

    [ this._head, this._tail ] = [ this._tail, this._head ];
    let current = this._head;

    while (current) {
      [ current.next, current.previous ] = [ current.previous, current.next ];
      current = current.next;
    }
  }
}

class Node<T> {
  data: T;
  next: Node<T> | null;
  previous: Node<T> | null;

  constructor(data: T, previous: Node<T> | null = null, next: Node<T> | null = null) {
    this.data = data;
    this.previous = previous;
    this.next = next;
  }
}
