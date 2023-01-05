
    <!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <div class="main">


                            <div class="containers">


                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <form id="signup-form" class="signup-form">
                                       <!-- {{csrf_field()}} -->
                                       <!-- <input type="hidden" id="_token" value="{{ csrf_token() }}"> -->
                                       {{ method_field('PUT') }}

                                      <input type="hidden" name="id" id="id">
                                        <h2 class="form-title">Edit Teacher</h2>
                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="name" name="name"
                                                   >
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="email" name="email"
                                                  >
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="address" name="address"
                                                  >
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Password </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="password" name="password"
                                                 >
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Mobile</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="mobile" name="mobile"
                                                   >
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Role</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="roles" id="roles">
                                                    <option>-- Select Role--</option>
                                                    <option value="admin">Admin</option>
                                                    <option value="student">Student</option>
                                                    <option value="teacher">Teacher</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" name="submit" id="submit" class="form-submit"
                                                value="Sign up" />
                                        </div>


                                    </form>


                            </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
