const toggle_btn = document.querySelector('.nav_toggle');
const menu = document.querySelector('.nav_menu');
const icon = document.querySelector('.nav_icon');
const btn = document.querySelector('#check-btn');

toggle_btn.addEventListener('click',()=>{
    menu.classList.toggle('active')
    icon.classList.toggle('active')
    btn.classList.toggle('active')
})