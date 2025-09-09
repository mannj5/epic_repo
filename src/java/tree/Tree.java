package tree;

import java.util.List;
import java.util.ArrayList;

public class Tree<T> {
    private T head;
    private List<Tree<T>> trees;
    
    public Tree() {
    }

    public Tree(T head, List<T> nodes) {
        this.head = head;
    }
}
