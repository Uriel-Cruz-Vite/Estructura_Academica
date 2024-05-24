function getDatos() {
    fetch("http://localhost:8000/getAula.php")
        .then(res => res.json())
        .then(data => console.log(data))
        .catch(e => {
            console.error(e);
        })
}

function postLoggin() {
    fetch('http://localhost:8000/loggin.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            user: 'usuario2',
            password: '123456'
        })
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle any errors that occurred during the fetch request
        });
}
getDatos();
postLoggin();