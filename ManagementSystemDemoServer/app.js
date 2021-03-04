/**
 * Created by lzjyz on 2020/7/22.
 */

const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();
app.use(express.static('public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
const port = 8888;
app.get('/', function (req, res) {
    res.send('Hello World!')
});

function formatDate(fmt, date) {
    let ret;
    const opt = {
        "Y+": date.getFullYear().toString(), // 年
        "m+": (date.getMonth() + 1).toString(), // 月
        "d+": date.getDate().toString(), // 日
        "H+": date.getHours().toString(), // 时
        "M+": date.getMinutes().toString(), // 分
        "S+": date.getSeconds().toString(), // 秒
        // 有其他格式化字符需求可以继续添加，必须转化成字符串
    };
    for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
            fmt = fmt.replace(
                ret[1],
                ret[1].length == 1 ? opt[k] : opt[k].padStart(ret[1].length, "0")
            );
        }
    }
    return fmt;
}

function getConnection() {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'qhg'
    });
    connection.connect();
    return connection;
}
app.post('/userLogin', function (req, res) {
    var connection = getConnection();
    connection.query("select * from staff where StaffName = ? and Pwd = ?", [req.body.username, req.body.password], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.length <= 0)
            res.send({
                code: 200,
                message: '登录失败'
            });
        else
            res.send({
                code: 200,
                message: '登录成功',
                staffInfo: results[0]
            });
    });
    connection.end();
});
app.post('/deptList', function (req, res) {
    var connection = getConnection();
    connection.query("SELECT * FROM department;", [], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else
            res.send({
                code: 200,
                message: '查询成功',
                data: results
            });
    });
    connection.end();
});
app.post('/addDept', function (req, res) {
    var connection = getConnection();
    connection.query("insert into department(DeptName,DeptDescript) values(?,?)", [req.body.deptName, req.body.deptDescript], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '添加成功'
            });
        else
            res.send({
                code: 200,
                message: '添加失败'
            });
    });
    connection.end();
});
app.post('/delDept', function (req, res) {
    var connection = getConnection();
    connection.query("update department set status = 0 where deptNo = ?", [req.body.deptNo], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '删除成功'
            });
        else
            res.send({
                code: 200,
                message: '删除失败'
            });
    });
    connection.end();
});
app.post('/editDept', function (req, res) {
    var connection = getConnection();
    var params = [req.body.deptName, req.body.deptDescript, req.body.status, req.body.deptNo];
    connection.query("update department set DeptName = ?,DeptDescript = ?,Status = ? where deptNo = ?", params, function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '修改成功'
            });
        else
            res.send({
                code: 200,
                message: '修改失败'
            });
    });
    connection.end();
});

app.post('/staffList', function (req, res) {
    var connection = getConnection();
    connection.query("SELECT StaffNo,StaffName,Phone,Job,s.DeptNo,d.DeptName,BirthDay,Sex,s.Status,s.CreateDate FROM staff s JOIN department d ON s.DeptNo = d.DeptNo;", [], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else
            res.send({
                code: 200,
                message: '查询成功',
                data: results
            });
    });
    connection.end();
})
app.post('/deptOption', function (req, res) {
    var connection = getConnection();
    connection.query("SELECT deptNo,deptName FROM department WHERE STATUS=1;", [], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else
            res.send({
                code: 200,
                message: '查询成功',
                data: results
            });
    });
    connection.end();
})
app.post('/addStaff', function (req, res) {
    var connection = getConnection();
    var params = [
        req.body.staffName, req.body.phone, req.body.phone, req.body.job, req.body.deptNo, req.body.birthDay === '' ? '0000-00-00' : formatDate('YYYY-mm-dd',new Date(req.body.birthDay)), req.body.sex
    ]
    connection.query("INSERT INTO staff(StaffName,Pwd,Phone,Job,DeptNo,BirthDay,Sex) VALUES(?,?,?,?,?,?,?)", params, function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '添加成功'
            });
        else
            res.send({
                code: 200,
                message: '添加失败'
            });
    });
    connection.end();
})
app.post('/editStaff', function (req, res) {
    var connection = getConnection();
    var params = [req.body.staffName, req.body.phone, req.body.job, req.body.deptNo, req.body.birthDay === '' ? '0000-00-00' : formatDate('YYYY-mm-dd',new Date(req.body.birthDay)) , req.body.sex, req.body.status, req.body.staffNo];
    connection.query("UPDATE staff SET StaffName = ?,Phone = ?,Job = ?,DeptNo = ?,BirthDay = ?,Sex = ?,Status = ? WHERE StaffNo = ?", params, function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '修改成功'
            });
        else
            res.send({
                code: 200,
                message: '修改失败'
            });
    });
    connection.end();
})
app.post('/delStaff',function(req,res){
    var connection = getConnection();
    connection.query("UPDATE staff SET Status = 0 WHERE StaffNo=?", [req.body.staffNo], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '删除成功'
            });
        else
            res.send({
                code: 200,
                message: '删除失败'
            });
    });
    connection.end();
})
app.post('/resetPwd',function(req,res){
    var connection = getConnection();
    connection.query("UPDATE staff SET Pwd = Phone WHERE StaffNo=?", [req.body.staffNo], function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else if (results.affectedRows > 0)
            res.send({
                code: 200,
                message: '重置成功'
            });
        else
            res.send({
                code: 200,
                message: '重置失败'
            });
    });
    connection.end();
})
app.post('/searchStaff',function(req,res){
    var connection = getConnection();
    var params = ["%"+req.body.searchKey+"%","%"+req.body.searchKey+"%"]
    connection.query("SELECT StaffNo,StaffName,Phone,Job,s.DeptNo,d.DeptName,BirthDay,Sex,s.Status,s.CreateDate FROM staff s JOIN department d ON s.DeptNo = d.DeptNo WHERE StaffName LIKE ? OR Job LIKE ?;", params, function (error, results) {
        if (error) {
            res.send({
                code: 500,
                message: '系统错误，请联系管理员！'
            });
            console.log(error);
        } else
            res.send({
                code: 200,
                message: '搜索成功',
                data: results
            });
    });
    connection.end();
})
app.listen(port, function () {
    console.log('Server listening on port:' + port);
});