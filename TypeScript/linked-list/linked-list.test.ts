import { LinkedList } from './linked-list';

describe('Empty linked list', () => {
  it('returns null for head node by default', () => {
    const linkedList = new LinkedList<string>();
    expect(linkedList.head).toBeNull();
    expect(linkedList.tail).toBeNull();
  });

  it('returns null for tail node by default', () => {
    const linkedList = new LinkedList<number>();
    expect(linkedList.tail).toBeNull();
    expect(linkedList.tail).toBeNull();
  });

  it('is 0 length by default', () => {
    const linkedList = new LinkedList<boolean>();
    expect(linkedList.length).toEqual(0);
  });

  it('can add a node', () => {
    const linkedList = new LinkedList<number>();
    linkedList.add(1);
    expect(linkedList.length).toEqual(1);
    expect(linkedList.head?.data).toEqual(1);
    expect(linkedList.head?.next).toBeNull();
    expect(linkedList.tail?.data).toEqual(1);
    expect(linkedList.tail?.previous).toBeNull();
  });

  it('can add multiple nodes', () => {
    const linkedList = new LinkedList<number>();
    linkedList.add(1);
    linkedList.add(2);
    expect(linkedList.length).toEqual(2);
    expect(linkedList.head?.previous).toBeNull();
    expect(linkedList.head?.data).toEqual(1);
    expect(linkedList.head?.next?.data).toEqual(2);
    expect(linkedList.head?.next?.next).toBeNull();
    expect(linkedList.tail?.next).toBeNull();
    expect(linkedList.tail?.data).toEqual(2);
    expect(linkedList.tail?.previous?.data).toEqual(1);
    expect(linkedList.tail?.previous?.previous).toBeNull();
  });
});

describe('Linked list with nodes', () => {
  let linkedList = new LinkedList<string>();

  beforeEach(() => {
    linkedList = new LinkedList<string>();
    linkedList.add('node 1');
    linkedList.add('node 2');
    linkedList.add('node 3');
  });

  it('can traverse the linked list and execute a callback on each node', () => {
    const callback = jest.fn();
    linkedList.traverse(callback);
    expect(callback).toHaveBeenCalledTimes(3);
    expect(callback).toHaveBeenNthCalledWith(1, linkedList.head);
    expect(callback).toHaveBeenNthCalledWith(2, linkedList.head?.next);
    expect(callback).toHaveBeenNthCalledWith(3, linkedList.head?.next?.next);
  });

  it('resets the linked list', () => {
    linkedList.resetList();
    expect(linkedList.length).toEqual(0);
    expect(linkedList.head).toBeNull();
    expect(linkedList.tail).toBeNull();
  });
  
  it('can delete first nodes', () => {
    linkedList.deleteFirst();
    expect(linkedList.length).toEqual(2);
    expect(linkedList.head?.data).toEqual('node 2');
    expect(linkedList.head?.previous).toBeNull();
    expect(linkedList.head?.next?.data).toEqual('node 3');
    linkedList.deleteFirst();
    linkedList.deleteFirst();
    expect(linkedList.length).toEqual(0);
    expect(linkedList.head).toBeNull();
    expect(linkedList.tail).toBeNull();
  });

  it('can delete last nodes', () => {
    linkedList.deleteLast();
    expect(linkedList.length).toEqual(2);
    expect(linkedList.tail?.data).toEqual('node 2');
    expect(linkedList.tail?.next).toBeNull();
    expect(linkedList.tail?.previous?.data).toEqual('node 1');
    linkedList.deleteLast();
    linkedList.deleteLast();
    expect(linkedList.length).toEqual(0);
    expect(linkedList.head).toBeNull();
    expect(linkedList.tail).toBeNull();
  });

  it('returns the node at the specified index', () => {
    expect(linkedList.nodeAtIndex(1)?.data).toEqual('node 1');
    expect(linkedList.nodeAtIndex(2)?.data).toEqual('node 2');
    expect(linkedList.nodeAtIndex(3)?.data).toEqual('node 3');
  });

  it('throws an error when the index is out of bounds', () => {
    expect(() => linkedList.nodeAtIndex(0)).toThrow('Index is out of bounds.');
    expect(() => linkedList.nodeAtIndex(4)).toThrow('Index is out of bounds.');
  });

  it('can find a node that satisfies the comparator', () => {
    const result = linkedList.find((data) => data === 'node 2');
    expect(result?.data).toEqual('node 2');
  });

  it('returns null when no node satisfies the comparator', () => {
    const result = linkedList.find((data) => data === 'node 4');
    expect(result).toBeNull();
  });

  it('can delete the first node by index', () => {
    linkedList.deleteByIndex(1);
    expect(linkedList.length).toEqual(2);
    expect(linkedList.head?.data).toEqual('node 2');
    expect(linkedList.head?.previous).toBeNull();
    expect(linkedList.head?.next?.data).toEqual('node 3');
  });

  it('can delete the last node by index', () => {
    linkedList.deleteByIndex(3);
    expect(linkedList.length).toEqual(2);
    expect(linkedList.tail?.data).toEqual('node 2');
    expect(linkedList.tail?.next).toBeNull();
    expect(linkedList.tail?.previous?.data).toEqual('node 1');
  });

  it('can delete node in the middle of the linked list by index', () => {
    linkedList.deleteByIndex(2);
    expect(linkedList.length).toEqual(2);
    expect(linkedList.head?.data).toEqual('node 1');
    expect(linkedList.head?.next?.data).toEqual('node 3');
    expect(linkedList.tail?.data).toEqual('node 3');
    expect(linkedList.tail?.previous?.data).toEqual('node 1');
  });

  it('throws error when index is out of bounds on delete by index', () => {
    expect(() => linkedList.deleteByIndex(0)).toThrow('Index is out of bounds.');
    expect(() => linkedList.deleteByIndex(4)).toThrow('Index is out of bounds.');
  });

  it('can insert a node at the beginning of the list', () => {
    linkedList.insert(1, 'Inserted node');
    expect(linkedList.head?.data).toEqual('Inserted node');
    expect(linkedList.head?.previous).toBeNull();
    expect(linkedList.head?.next?.data).toEqual('node 1');
  });

  it('can insert a node at the end of the list', () => {
    linkedList.insert(4, 'Inserted node');
    expect(linkedList.tail?.data).toEqual('Inserted node');
    expect(linkedList.tail?.next).toBeNull();
    expect(linkedList.tail?.previous?.data).toEqual('node 3');
  });

  it('can insert a node at a specified index', () => {
    linkedList.insert(2, 'Inserted node');
    const insertedNode = linkedList.head?.next;
    expect(insertedNode?.previous?.data).toEqual('node 1');
    expect(insertedNode?.data).toEqual('Inserted node');
    expect(insertedNode?.next?.data).toEqual('node 2');
    expect(insertedNode?.previous?.next?.data).toEqual('Inserted node');
    expect(insertedNode?.next?.previous?.data).toEqual('Inserted node');
  });

  it('throws error when index is out of bounds on insert by index', () => {
    expect(() => linkedList.insert(0, 'Inserted node')).toThrowError();
    expect(() => linkedList.insert(5, 'Inserted node')).toThrowError();
  });

  it('can reverse', () => {
    linkedList.reverse();
    expect(linkedList.head?.previous).toBeNull();
    expect(linkedList.head?.data).toEqual('node 3');
    expect(linkedList.head?.next?.data).toEqual('node 2');
    expect(linkedList.head?.next?.next?.data).toEqual('node 1');
    expect(linkedList.head?.next?.next?.next).toBeNull();
    expect(linkedList.tail?.next).toBeNull();
    expect(linkedList.tail?.data).toEqual('node 1');
    expect(linkedList.tail?.previous?.data).toEqual('node 2');
    expect(linkedList.tail?.previous?.previous?.data).toEqual('node 3');
    expect(linkedList.tail?.previous?.previous?.previous).toBeNull();
  });
});
