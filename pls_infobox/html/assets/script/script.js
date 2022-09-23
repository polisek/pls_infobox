
var menuopen = false
var app =  Vue.createApp({
    data() {
      return {
        title: 'Title message',
        content:[
            {uname:"test1",menu:"Test 1",heading:"Heading 1",content:"Lorem Ipsum is simply dummy text of the printin"},
        ],
        button:[],
      }
    },
  mounted(){
    

    document.getElementById("button_"+this.content[0].uname).classList.add("active")
    document.getElementById(this.content[0].uname).classList.add("active")
    
      
  },
  methods:{
    setData(data){
        this.content = [];
        this.title = data.title;
        this.content = data.content;
        this.button = data.button; 

        /* 
            #br  - Řádek níže
            #b #/b - Tučný text
            #clred #/cl - Barva červená u textu
            #clblue #/cl - Barva modrá u textu
            #clgreen #/cl - Barva zelená u textu
            #clwhite #/cl - Barva bílá u textu
            #clpink #/cl - Barva růžová u textu
        */


        this.content.forEach(cnt => {
            cnt.content = cnt.content.replaceAll('#br', '<br>'); 
            //Open
            cnt.content = cnt.content.replaceAll('#clred', '<span class="cl-red">');
            cnt.content = cnt.content.replaceAll('#clblue', '<span class="cl-blue">');
            cnt.content = cnt.content.replaceAll('#clgreen', '<span class="cl-green">');
            cnt.content = cnt.content.replaceAll('#clwhite', '<span class="cl-white">');
            cnt.content = cnt.content.replaceAll('#clpink', '<span class="cl-pink">');
            //Close
            cnt.content = cnt.content.replaceAll('#/cl', '</span>');
            cnt.content = cnt.content.replaceAll('#b', '<b>');  
            cnt.content = cnt.content.replaceAll('#/b', '</b>');  
        });
 
        document.getElementById("ap1").style.display = "flex";
        menuopen = true
    },
    navChange(e){
        const target = e.currentTarget.getAttribute("target");
        const menus = document.querySelectorAll('.navbar-item');
        const contents = document.querySelectorAll('.content-list');
        menus.forEach(box => {
            box.classList.remove("active");
        });
        contents.forEach(box => {
            box.classList.remove("active");
        });
        document.getElementById("button_"+target).classList.add("active");
        document.getElementById(target).classList.add("active");
    },
    confirmButton(){
        var bdata = this.button
        fetch(`https://pls_infobox/confirmbutton`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        }, 
        body: JSON.stringify({
            value: bdata,
        })
        }).then(resp => resp.json()).then(resp => console.log(resp));
        document.getElementById("ap1").style.display = "none"
    }
  },
  
  
  }).mount('#app');




  window.addEventListener("message", function(e){ 
      let data = e.data;
      if (data.action == "open" ){
        app.setData(data);
      }else if (data.action == "close" ){
        document.getElementById("ap1").style.display = "none"
      }
  }); 

  document.addEventListener("keydown", (e) => {
    if(menuopen  == true){
        if (e.key == "Escape") {
            document.getElementById("ap1").style.display = "none"
            menuopen = false
            fetch(`https://pls_infobox/closeInfoBox`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: JSON.stringify({})
            }).then(resp => resp.json()).then(resp => console.log(resp));
            }
    }
});