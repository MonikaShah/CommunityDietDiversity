const footer_adjust = () => {
    let height = window.innerHeight - 60
    document.getElementById("content").style.minHeight = height.toString()+"px"
}
footer_adjust()