class Cart
	items
	constructor
		let p1 = {id:1, title:'title', img:'abc.jpg', description:'desc',category:1, price:123.5}
		let p2 = {id:2, title:'title 2', img:'abc.jpg', description:'desc2',category:2, price:456.5}
		let p3 = {id:3, title:'title 3', img:'abc.jpg', description:'desc3',category:3, price:789.5}
		items = [p1, p2, p3]
	def add cart
		items.push cart

const cart = new Cart()

tag Header
	<self>
		<div[bg:blue9 c:white d:flex p:4 w:100vw]>
			<a[px:10 py:2 c:white] href='/'> "Simple eCommerce"
			<input[p:2 bg:white c:black rd:lg]>
			<div[px:10 py:2 jc:end]> "Cart"
			<div> "Clear Cart"

tag Product
	<self[bd:1px rd:lg m:2]>
		<a[m:w bd:1 blue6] href="/detail/{data.id}">
			<h3[py:2 px:4 w:100%]> data.title
		<div[d:flex js:center] /> <img src=data.img>
		<div> data.description
		<div> data.category
		<div> data.price
		<button> "Add To Cart"

tag ProductPage
	<self>
		for p in data.items
			<Product data=p>

tag ProductDetail
	<self>
		data = cart.items[route.params.id - 1]
		<h3> data.title
		<img src=data.img>
		<div> data.description
		<div> data.category
		<div> data.price
		<button> "Add to Cart"

tag App
	<self>
		<Header>
		<ProductPage data=cart route='/'>		
		<ProductDetail route='/detail/:id'>


imba.mount <App>
