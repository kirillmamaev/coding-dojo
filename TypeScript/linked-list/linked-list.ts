/**
 * Doubly linked list implementation.
 */
export class LinkedList<T> {
  private _head: Node<T> | null = null;
  private _tail: Node<T> | null = null;

  /**
   * Returns the head node of the linked list.
   */
  get head(): Node<T> | null {
    return this._head;
  }

  /**
   * Returns the tail node of the linked list.
   */
  get tail(): Node<T> | null {
    return this._tail;
  }

  /**
   * Returns the length of the linked list.
   */
  get length(): number {
    let nodeCounter = 0;
    this.traverse(() => {
      nodeCounter++;
      return true;
    });
    return nodeCounter;
  }

  /**
   * Resets the linked list to an empty state.
   */
  resetList(): void {
    this._head = null;
    this._tail = null;
  }

  /**
   * Traverses the linked list, and executes a callback on each node.
   * Stops traversing if the callback returns false.
   * @param callback - The callback to execute on each node.
   */
  traverse(callback: (node: Node<T>) => boolean = () => false): Node<T> | null {
    let node = this._head;
    while (node) {
      if (!callback(node)) break;
      node = node.next;
    }
    return node;
  }

  /**
   * Adds a new node with data to the end of the linked list.
   * @param data - Data the new node to be added.
   */
  add(data: T): void {
    const newNode = new Node<T>(data, this._tail);

    // Add first if list is empty.
    if (!this._head) {
      this._head = newNode;
      this._tail = this._head;
      return;
    }

    // Add to the end if list is not empty.
    if (this._tail) {
      this._tail.next = newNode;
    }
    this._tail = newNode;
  }

  /**
   * Deletes the first node of the linked list.
   */
  deleteFirst(): void {
    if (!this._head) return;

    // Delete the only node.
    if (this._head === this._tail) {
      this.resetList();
      return;
    }

    // Delete the first node.
    if (this._head?.next) {
      this._head = this._head.next;
      this._head.previous = null;
    }
  }

  /**
   * Deletes the last node of the linked list.
   */
  deleteLast(): void {
    if (!this._tail) return;

    // Delete the only node.
    if (this._tail === this._head) {
      this.resetList();
      return;
    }

    // Delete the last node.
    if (this._tail?.previous) {
      this._tail = this._tail.previous;
      this._tail.next = null;
    }
  }

  /**
   * Returns the node at the specified index.
   * @param index - The index of the node to return.
   * @throws Error, if the index is out of bounds.
   */
  nodeAtIndex(index: number): Node<T> | null {
    if (!this._head) return null;

    // Throw an error if the index is out of bounds.
    if (index < 1 || index > this.length) {
      throw new Error('Index is out of bounds.');
    }

    let currentIndex = 1;
    return this.traverse(() => currentIndex++ < index);
  }

  /**
   * Finds a node that contains the data.
   * @param data - The data to find in the linked list.
   */
  find(data: T): Node<T> | null {
    return this.traverse((node) => node.data !== data);
  }

  /**
   * Deletes the node at the specified index.
   * @param targetIndex - The index of the node to delete.
   */
  deleteByIndex(targetIndex: number): void {
    // Delete at first
    if (targetIndex === 1) {
      this.deleteFirst();
      return;
    }

    let node = this.nodeAtIndex(targetIndex);

    // Delete at last
    if (!node?.next) {
      this.deleteLast();
      return;
    }

    // Delete in the middle
    if (node.previous && node.next) {
      [node.previous.next, node.next.previous] = [node.next, node.previous];
    }
  }

  /**
   * Inserts a new node at the specified index.
   * @param targetIndex - The index at which to insert the new node.
   * @param data - The data to insert into the linked list.
   */
  insert(targetIndex: number, data: T): void {
    // Insert at last
    if (targetIndex === this.length + 1) {
      this.add(data);
      return;
    }

    const newNode = new Node(data, null, this._head);

    // Insert at first
    if (targetIndex === 1) {
      this._head = newNode;
      return;
    }

    // Insert in the middle
    let node = this.nodeAtIndex(targetIndex);
    if (node?.previous) {
      newNode.previous = node.previous;
      newNode.next = node;
      node.previous.next = newNode;
      node.previous = newNode;
    }
  }

  /**
   * Reverses the linked list.
   */
  reverse(): void {
    if (!this._head || this._head === this._tail) return;

    [this._head, this._tail] = [this._tail, this._head];

    this.traverse((currentNode) => {
      [currentNode.next, currentNode.previous] = [currentNode.previous, currentNode.next];
      return true;
    });
  }
}

/**
 * Node class for the linked list.
 */
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
