// Main feed / landing page after login
(()=> {// Protect the Lemurs
	function renderFollowers(posts) {
	    const feed = document.querySelector('.js-feed-feed');
	    feed.innerHTML = '';
	    for (const postItem of posts) {
	    	console.log('in renderfeed loop')
		    const h4 = document.createElement('h4');
		    h4.innerHTML = `
	                <span class='js-feed-username'>${postItem.username}</span>
		            <div class='js-image'>
		            	<img class ='js-feed-images' src="${postItem.post}" alt="" >
	                </div>
	                `;

	        console.log(h4)
	        feed.appendChild(h4)
	    }
		if (posts.length === 0) {
			feed.innerHTML = `
				<li class="list-group-item">
				No Posts!
				</li>
			`;
		}


    };


	function GET(url) {
        return new Promise((resolve, reject) => {
            const request = new XMLHttpRequest();
            request.open('GET', url);
            request.onload = () => {
                const data = JSON.parse(request.responseText);
                resolve(data)
            }; 
            request.onerror = (err) => {
                reject(err)
            };
            request.send();
        });
    }; // GET

	const userId = localStorage.getItem('currentUser')
	console.log(userId)

	GET(`/api/${userId}/posts`).then(res => {
    	console.log(res, 'in api/id/testing')
    	renderFollowers(res)

    	//Render DOM HERE
    })

})()