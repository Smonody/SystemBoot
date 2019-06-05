/*
var Main = {
    data(){

    }
}
var Ctor = Vue.extend(Main)
new Ctor().$mount('#select')*/
var Main = {
    data() {
        return {
            dialogVisible: false,
            update:false,
            add:false,
            select:false
        };
    },
    methods: {
        handleClose(done) {
            this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                })
                .catch(_ => {});
        }
    }
};

var Ctor = Vue.extend(Main)
new Ctor().$mount('#container')