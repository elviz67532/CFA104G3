package core.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.move_photo.model.MovePhotoDAO;
import com.move_photo.model.MovePhotoDAOJDBCImpl;
import com.move_photo.model.MovePhotoVO;

public class SimulationPhotoInsertUtil {
	private static final Path simulationImgRoot = Paths.get("./src/main/webapp/asset/img/simulationImg/");

	public static void main(String[] args) {
		try {
			insertMemberPhotos();
			insertNewsPhotos();	
			insertMovePhotos();
			insertProductPhotos();		
			insertProductReportPhotos();
			insertActivityPhotos();		
			insertActivityReportPhotos();		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static void insertMemberPhotos() {
		// TODO Auto-generated method stub
		
	}
	private static void insertNewsPhotos() {
		// TODO Auto-generated method stub
		
	}

	private static void insertMovePhotos() throws IOException {
		MovePhotoDAO impl = new MovePhotoDAOJDBCImpl();
		impl.insert(new MovePhotoVO(0, 1, getData("activity/act_01.jpg")));
		impl.insert(new MovePhotoVO(0, 1, getData("activity/act_02.jpg")));
		impl.insert(new MovePhotoVO(0, 3, getData("activity/act_03.jpg")));
	}

	private static void insertProductPhotos() {
		// TODO Auto-generated method stub
		
	}

	private static void insertProductReportPhotos() {
		// TODO Auto-generated method stub
		
	}

	private static void insertActivityPhotos() {
		// TODO Auto-generated method stub
		
	}

	private static void insertActivityReportPhotos() {
		// TODO Auto-generated method stub
		
	}
	
	private static byte[] getData(String relativeFilePath) throws IOException {
		Path path = Paths.get(simulationImgRoot.toAbsolutePath().toString(), relativeFilePath);
		File file = path.toFile();
		return CommonUtil.getPictureByteArray(file.toString());
	}
}
