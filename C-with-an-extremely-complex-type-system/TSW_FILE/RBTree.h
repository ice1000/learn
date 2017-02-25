#pragma once

/*/ 
 * ºìºÚÊ÷Ä£°å - SKFE
 * DynamicRBTree:¶¯Ì¬·ÖÅäÄÚ´æµÄºìºÚÊ÷
/*/

#include "Allocator.h"
#include "Comparer.h"

namespace skfe {

#define NULL 0
#define decl_iterator typename decl_spec::iterator
#define decl_template template<typename T, typename f_Comparer, typename f_updater>
#define decl_spec DynamicRBTree<T, f_Comparer, f_updater>

	namespace Tree {
		template<typename T>
		class NullUpdater {
			public:
				void operator()(T *, const T *, const T *) {}
		};
	}

	template<typename T, typename f_Comparer = less<T>, typename f_updater = Tree::NullUpdater<T> >
	class DynamicRBTree {
			struct node {
				node *p, *ch[2];
				unsigned char type;
				T data;
			};
		private:
			node nnil, *nil, *root;
			f_Comparer comp;
			f_updater update;
			void rot(node *);
			void DeleteTree(node *);
			template<typename f_handler> void ForEachNode(node *, f_handler);
		public:
			class iterator {
					friend class DynamicRBTree;
				private:
					node *pt;
					DynamicRBTree *tree;
					iterator(node *_pt, DynamicRBTree *_tree): pt(_pt), tree(_tree) {}
				public:
					iterator(): pt(NULL), tree(NULL) {}
					iterator(const iterator &) = default;
					const T &operator*() const {
						return pt->data;
					}
					const T *operator->() const {
						if (pt) return &pt->data;
						else return NULL;
					}
					operator bool() const {
						return pt && pt != tree->nil;
					}
					iterator operator++(int) {
						iterator ret(*this);
						if (pt && pt != tree->nil) {
							if (pt->ch[1] != tree->nil) {
								pt = pt->ch[1];
								while (pt->ch[0] != tree->nil) pt = pt->ch[0];
							}
							else {
								while (pt != tree->root && pt == pt->p->ch[1])
									pt = pt->p;
								if (pt == tree->root) pt = tree->nil;
								else pt = pt->p;
							}
						}
						return ret;
					}
					iterator &operator++() {
						if (pt && pt != tree->nil) {
							if (pt->ch[1] != tree->nil) {
								pt = pt->ch[1];
								while (pt->ch[0] != tree->nil) pt = pt->ch[0];
							}
							else {
								while (pt != tree->root && pt == pt->p->ch[1])
									pt = pt->p;
								if (pt == tree->root) pt = tree->nil;
								else pt = pt->p;
							}
						}
						return *this;
					}
					iterator operator--(int) {
						iterator ret(*this);
						if (pt && pt != tree->nil) {
							if (pt->ch[0] != tree->nil) {
								pt = pt->ch[0];
								while (pt->ch[1] != tree->nil) pt = pt->ch[1];
							}
							else {
								while (pt != tree->root && pt == pt->p->ch[0])
									pt = pt->p;
								if (pt == tree->root) pt = tree->nil;
								else pt = pt->p;
							}
						}
						return ret;
					}
					iterator &operator--() {
						if (pt && pt != tree->nil) {
							if (pt->ch[0] != tree->nil) {
								pt = pt->ch[0];
								while (pt->ch[1] != tree->nil) pt = pt->ch[1];
							}
							else {
								while (pt != tree->root && pt == pt->p->ch[0])
									pt = pt->p;
								if (pt == tree->root) pt = tree->nil;
								else pt = pt->p;
							}
						}
						return *this;
					}
					int operator==(const iterator &it) const {
						return tree == it.tree && pt == it.pt;
					}
					int operator!=(const iterator &it) const {
						return tree != it.tree || pt != it.pt;
					}
			};

			iterator begin();
			iterator end();

			inline DynamicRBTree();
			DynamicRBTree(const DynamicRBTree &) = delete;
			virtual ~DynamicRBTree();

			iterator Insert(const T &);
			template<typename f_NewComparer = f_Comparer>
			iterator Insert(const T &, f_NewComparer);

			int Erase(const T &);
			/*template<typename f_NewComparer = f_Comparer>
			int Erase(const T &, f_NewComparer);

			int Erase(const iterator &);
			template<typename f_NewComparer = f_Comparer>
			int Erase(const iterator &, f_NewComparer);*/

			iterator Find(const T &);
			/*template<typename f_NewComparer = f_Comparer>
			iterator Find(const T &, f_NewComparer);*/

			iterator LowerBoundItem(const T &);
			/*template<typename f_NewComparer = f_Comparer>
			iterator LowerBoundItem(const T &, f_NewComparer);*/

			iterator UpperBoundItem(const T &);
			/*template<typename f_NewComparer = f_Comparer>
			iterator UpperBoundItem(const T &, f_NewComparer);*/

			void EraseAll();
			template<typename f_handler> void ForEach(f_handler);
	};

	decl_template
	decl_iterator decl_spec::begin() {
		node *pt = root;
		if (pt == nil) return iterator(nil, this);
		while (pt->ch[0] != nil) pt = pt->ch[0];
		return iterator(pt, this);
	}

	decl_template
	decl_iterator decl_spec::end() {
		return iterator(nil, this);
	}

	decl_template
	decl_spec::DynamicRBTree(): nil(&nnil), root(nil) {
		nil->type = 0;
	}

	decl_template
	decl_spec::~DynamicRBTree() {
		DeleteTree(root);
	}

	decl_template
	void decl_spec::DeleteTree(node *x) {
		if (x->ch[0] != nil) DeleteTree(x->ch[0]);
		if (x->ch[1] != nil) DeleteTree(x->ch[1]);
		delete x;
	}

	decl_template
	decl_iterator decl_spec::Insert(const T &data) {
		node *x = root, *y = nil;
		int rec;
		while (x != nil) {
			y = x;
			if (comp(data, x->data)) x = x->ch[0], rec = 0;
			else if (comp(x->data, data)) x = x->ch[1], rec = 1;
			else return iterator(nil, this);
		}
		x = new node;
		x->p = y;
		x->ch[1] = x->ch[0] = nil;
		x->type = 1;
		x->data = data; // Type T must support "operator="
		iterator ret(x, this);
		if (y == nil) root = x;
		else y->ch[rec] = x;
		while (y != nil) {
			update(&y->data, y->ch[0] != nil ? &y->ch[0]->data : NULL, y->ch[1] != nil ? &y->ch[1]->data : NULL);
			y = y->p;
		}
		while (x->p->type) {
			node *p = x->p;
			int dir = p->p->ch[1] == p;
			node *w = p->p->ch[!dir];
			if (w->type) w->type = p->type = 0, x = p->p, x->type = 1;
			else {
				if ((p->ch[1] == x) != dir) rot(x), x = x->ch[dir];
				x->p->type = 0;
				x->p->p->type = 1;
				rot(x->p);
			}
		}
		root->type = 0;
		return ret;
	}

	decl_template
	template<typename f_NewComparer>
	decl_iterator decl_spec::Insert(const T &data, f_NewComparer comp) {
		node *x = root, *y = nil;
		int rec;
		while (x != nil) {
			y = x;
			if (comp(data, x->data)) x = x->ch[0], rec = 0;
			else if (comp(x->data, data)) x = x->ch[1], rec = 1;
			else return iterator(nil, this);
		}
		x = new node;
		x->p = y;
		x->ch[1] = x->ch[0] = nil;
		x->type = 1;
		x->data = data; // Type T must support "operator="
		iterator ret(x, this);
		if (y == nil) root = x;
		else y->ch[rec] = x;
		while (y != nil) {
			update(&y->data, y->ch[0] != nil ? &y->ch[0]->data : NULL, y->ch[1] != nil ? &y->ch[1]->data : NULL);
			y = y->p;
		}
		while (x->p->type) {
			node *p = x->p;
			int dir = p->p->ch[1] == p;
			node *w = p->p->ch[!dir];
			if (w->type) w->type = p->type = 0, x = p->p, x->type = 1;
			else {
				if ((p->ch[1] == x) != dir) rot(x), x = x->ch[dir];
				x->p->type = 0;
				x->p->p->type = 1;
				rot(x->p);
			}
		}
		root->type = 0;
		return ret;
	}

	decl_template
	int decl_spec::Erase(const T &data) {
		node *x = root;
		while (x != nil) {
			if (comp(data, x->data)) x = x->ch[0];
			else if (comp(x->data, data)) x = x->ch[1];
			else break;
		}
		if (x == nil) return 0;
		node *y = x, *z;
		int ytype = y->type;
		if (y->ch[0] == nil) z = y->ch[1];
		else if (y->ch[1] == nil) z = y->ch[0];
		else {
			y = x->ch[1];
			while (y->ch[0] != nil) y = y->ch[0];
			z = y->ch[1];
			ytype = y->type;
		}
		z->p = y->p;
		if (y == root) root = z;
		else y->p->ch[y->p->ch[1] == y] = z;
		if (x != y) {
			y->p = x->p;
			if (x == root) root = y;
			else x->p->ch[x->p->ch[1] == x] = y;
			y->ch[0] = x->ch[0];
			y->ch[1] = x->ch[1];
			x->ch[0]->p = y;
			x->ch[1]->p = y;
		}
		x = z->p;
		while (x != nil) {
			update(&x->data, x->ch[0] != nil ? &x->ch[0]->data : NULL, x->ch[1] != nil ? &x->ch[1]->data : NULL);
			x = x->p;
		}
		if (!ytype) {
			while (!z->type && z != root) {
				int dir = z->p->ch[1] == z;
				node *w = z->p->ch[!dir];
				if (w->type) w->type = 0, z->p->type = 1, rot(w), w = z->p->ch[!dir];
				if (!w->ch[0]->type && !w->ch[1]->type) w->type = 1, x = x->p;
				else {
					if (!w->ch[!dir]->type) w->type = 1, w->ch[dir]->type = 0, rot(w->ch[dir]), w = w->p;
					w->ch[!dir]->type = 0;
					w->type = w->p->type;
					w->p->type = 0;
					rot(w);
					z = root;
				}
			}
			z->type = 0;
		}
		return 1;
	}

	decl_template
	decl_iterator decl_spec::Find(const T &data) {
		node *cur = root;
		while (cur != nil) {
			if (comp(data, cur->data)) cur = cur->ch[0];
			else if (comp(cur->data, data)) cur = cur->ch[1];
			else return iterator(cur, this);
		}
		return iterator(nil, this);
	}

	decl_template
	decl_iterator decl_spec::LowerBoundItem(const T &data) {
		node *cur = root, *rec = nil;
		while (cur != nil) {
			if (comp(cur->data, data)) cur = cur->ch[1];
			else rec = cur, cur = cur->ch[0];
		}
		return iterator(rec, this);
	}

	decl_template
	decl_iterator decl_spec::UpperBoundItem(const T &data) {
		node *cur = root, *rec = nil;
		while (cur != nil) {
			if (comp(data, cur->data)) rec = cur, cur = cur->ch[0];
			else cur = cur->ch[1];
		}
		return iterator(rec, this);
	}

	decl_template
	void decl_spec::EraseAll() {
		DeleteTree(root);
		root = nil;
	}

	decl_template
	template<typename f_handler>
	void decl_spec::ForEach(f_handler func) {
		ForEachNode(root, func);
	}

	decl_template
	void decl_spec::rot(node *x) {
		node *p = x->p, *g = p->p;
		int dir = p->ch[1] == x;
		node *give = x->ch[!dir];
		give->p = p;
		p->ch[dir] = give;
		p->p = x;
		x->ch[!dir] = p;
		x->p = g;
		if (g == nil) root = x;
		else g->ch[g->ch[1] == p] = x;
		update(&p->data, p->ch[0] != nil ? &p->ch[0]->data : NULL, p->ch[1] != nil ? &p->ch[1]->data : NULL);
		update(&x->data, x->ch[0] != nil ? &x->ch[0]->data : NULL, x->ch[1] != nil ? &x->ch[1]->data : NULL);
	}

	decl_template
	template<typename f_handler>
	void decl_spec::ForEachNode(node *x, f_handler func) {
		if (x->ch[0] != nil) ForEachNode(x->ch[0], func);
		func(x->data);
		if (x->ch[1] != nil) ForEachNode(x->ch[1], func);
	}
#undef decl_iterator
#undef decl_template
#undef decl_spec
}
