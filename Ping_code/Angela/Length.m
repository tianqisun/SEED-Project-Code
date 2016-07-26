function [EndLength] = Length(A)
% x = size(A,1);
B = A(:, [1 7]);
B(any(B<1,2),:) = [];
EndLength = sum(sqrt(sum((A(B(:,1),3:5) - A(B(:,2),3:5)).^2,2)));
% EndLength = 0;
% for i = 1:x
%     X1 = A(i,:);
%     
%     if (A(i,7)< 0)
%         continue
%     end
%     
%     X2 = A(A(i,7),:);
%     Distance = sqrt ((X1(3)-X2(3))^2 + (X1(4)-X2(4))^2 + (X1(5)-X2(5))^2); 
%     EndLength = EndLength + Distance;
% end

%[A(ni(i),3), A(nj(i),3)],[A(ni(i),4), A(nj(i),4)],[A(ni(i),5), A(nj(i),5)]

end

