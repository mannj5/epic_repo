import tree.Tree;
import array.CoolArray;

public class Main {
    public static void main(String[] args) {
        Tree<Integer> t = new Tree<>();

		CoolArray ca = new CoolArray(8);
		ca.print();
		for (int i = 0; i < 8; i++) {
			ca.set(i, i);
		}
		ca.print();
		ca.reverse();
		ca.print();
    }
}
