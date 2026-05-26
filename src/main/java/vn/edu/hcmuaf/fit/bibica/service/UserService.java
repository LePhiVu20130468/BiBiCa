package vn.edu.hcmuaf.fit.bibica.service;

import vn.edu.hcmuaf.fit.bibica.beans.User;
import vn.edu.hcmuaf.fit.bibica.dao.UserDAO;
import vn.edu.hcmuaf.fit.bibica.utils.GooglePojo;
import vn.edu.hcmuaf.fit.bibica.utils.HashingUtils;

import java.util.Optional;
import java.util.UUID;
import java.util.Random;

public class UserService extends Service<User, UserDAO> implements UserDAO {
    public UserService() {
        super(UserDAO.class);
    }

    @Override
    public Optional<User> getByUsername(String username) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByUsername(username));
    }

    @Override
    public void changePassword(long userId, String newPassword) {
        jdbi.useExtension(UserDAO.class, dao -> dao.changePassword(userId, newPassword));
    }

    @Override
    public Optional<User> getByEmail(String email) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByEmail(email));
    }

    @Override
    public Optional<User> getByPhoneNumber(String phoneNumber) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByPhoneNumber(phoneNumber));
    }

    @Override
    public int count() {
        return jdbi.withExtension(UserDAO.class, UserDAO::count);
    }

    // Override hàm mới thêm trong DAO: Đổi mật khẩu theo Email
    @Override
    public void changePasswordByEmail(String email, String newPassword) {
        jdbi.useExtension(UserDAO.class, dao -> dao.changePasswordByEmail(email, newPassword));
    }

    // Hàm tiện ích để kiểm tra email tồn tại (trả về boolean cho gọn)
    // Hàm này không nằm trong DAO, chỉ là logic của Service
    public boolean checkEmailExist(String email) {
        return getByEmail(email).isPresent();
    }

    public User processGoogleLogin(GooglePojo googleUser) {
        Optional<User> userOptional = getByEmail(googleUser.getEmail());

        if (userOptional.isPresent()) {
            // Trường hợp 1: Email đã tồn tại -> Đăng nhập luôn
            return userOptional.get();
        } else {
            // Trường hợp 2: Email chưa tồn tại -> Tạo user mới
            User newUser = new User();
            newUser.setEmail(googleUser.getEmail());
            newUser.setFullname(googleUser.getName());
            newUser.setRole("CUSTOMER");
            newUser.setGender(0); // Mặc định Nam hoặc Nữ tùy bạn
            newUser.setAddress("Cập nhật sau (Google Login)");

            // Tạo username từ email (lấy phần trước @)
            String baseUsername = googleUser.getEmail().split("@")[0];
            // Nếu username bị trùng thì thêm số ngẫu nhiên
            String finalUsername = baseUsername;
            while(getByUsername(finalUsername).isPresent()) {
                finalUsername = baseUsername + new Random().nextInt(1000);
            }
            newUser.setUsername(finalUsername);

            // Password ngẫu nhiên (User sẽ không biết pass này, họ đăng nhập bằng Google)
            newUser.setPassword(HashingUtils.hash(UUID.randomUUID().toString()));

            // Tạo số điện thoại ngẫu nhiên (Vì DB yêu cầu Unique và Not Null)
            // Prefix 000 để đánh dấu là user ảo, + 7 số ngẫu nhiên
            String randomPhone;
            do {
                randomPhone = "000" + (1000000 + new Random().nextInt(9000000));
            } while (getByPhoneNumber(randomPhone).isPresent());
            newUser.setPhoneNumber(randomPhone);

            // Lưu vào DB
            long newId = insert(newUser);
            newUser.setId(newId);

            return newUser;
        }
    }
}
