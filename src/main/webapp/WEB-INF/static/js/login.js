new Vue({
    el:"#loginBox",
    data:{
        title:"客户管理系统",
        username:"",
        password:""
    }
})
/*var Main = {
    data() {
        /!* var checkAge = (rule, value, callback) => {
             if (!value) {
                 return callback(new Error('年龄不能为空'));
             }
             setTimeout(() => {
                 if (!Number.isInteger(value)) {
                     callback(new Error('请输入数字值'));
                 } else {
                     if (value < 18) {
                         callback(new Error('必须年满18岁'));
                     } else {
                         callback();
                     }
                 }
             }, 1000);
         };*!/
        var validateUsername = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入账号'));
            }else if(value.length < 6){
                callback(new Error("账号不正确"));
            }
            callback();
        };
        var validatePassword = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else if(value.length < 6){
                callback(new Error("密码不正确"))
            } else {
                callback();
            }
        };
        return {
            ruleForm: {
                password: '',
                username: '',
                /!*age: ''*!/
            },
            rules: {
                username: [
                    { validator: validateUsername, trigger: 'blur' }
                ],
                password: [
                    { validator: validatePassword, trigger: 'blur' }
                ],
                /!*age: [
                    { validator: checkAge, trigger: 'blur' }
                ]*!/
            }
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    var data = JSON.stringify(this.ruleForm);
                    var user = JSON.parse(data);
                    var userName = user.username;
                    var passWord = user.password;

                    /!*axios({
                        method: 'post',
                        url: '/login/user',
                        data: {
                            'userName': userName,
                            'passWord': passWord
                        }
                    });*!/
                    /!*var user = new URLSearchParams();
                    user.append("username",userName);
                    user.append("password",passWord);*!/
                    alert(data);
                    axios.post('http://localhost:8080/SystemBoot_war_exploded/login',{
                        'userName':userName,
                        'passWord':passWord
                        }
                        /!*'userName':userName,
                        'passWord':passWord*!/
                        ,{headers: { 'Content-Type': 'application/json' }})
                        .then(/!*function (response) {
                            console.log(response);
                            var response = JSON.stringify(response.data.data);
                            console.log(response);
                        }*!/
                            res=>{
                                console.log(res.data);
                                console.log(res.request.responseURL);
                                var url = res.request.responseURL;
                                alert(url);
                            })
                        .catch(function (error) {
                            console.log(error);
                        });
                    /!*!// 添加响应拦截器
                    axios.interceptors.response.use(function (response) {
                        // 对响应数据做点什么
                        return response;
                    }, function (error) {
                        console.log(error.response.status);
                        // 对响应错误做点什么
                        return Promise.reject(error);
                    });*!/
                    /!*axios.get('http://localhost:8080/SystemBoot_war_exploded/login')
                        .then(function (response) {
                            console.log(response);
                        })
                        .catch(function (error) {
                            console.log(error);
                        });*!/
                } else {
                    console.log('error submit!!');
                    alert('error submit');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
}
var Ctor = Vue.extend(Main)
new Ctor().$mount('#login')*/

