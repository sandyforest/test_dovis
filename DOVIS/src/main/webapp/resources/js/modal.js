const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const open_btn = document.querySelector('.modal_btn');

open_btn.addEventListener('click',()=>{
    modal.classList.toggle('show');
    
    if(modal.classList.contains('show')){
        body.style.overflow = 'hidden';
    }
});
modal.addEventListener('click',(event)=>{
    if(event.target === modal){
        modal.classList.toggle('show');
        if(!modal.classList.contains('show')){
            body.style.overflow = 'auto';
        }
    }
})