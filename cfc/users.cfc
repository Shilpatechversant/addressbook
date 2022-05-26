component persistent="true" entityname="users" table="users"  {
    property name="id" column="id" fieldtype="id" generator="increment";
    property name="user_id" column="user_id" ormtype="string";
    property name="title" column="title" ormtype="string";
    property name="fname" column="fname" ormtype="string";
    property name="lname" column="lname" ormtype="string";
    property name="gender" column="gender" ormtype="string";
    property name="dob" column="dob" ormtype="string";
    property name="image" column="image" ormtype="string";
    property name="address" column="address" ormtype="string";
    property name="street" column="street" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="phone" column="phone" ormtype="string";
}    